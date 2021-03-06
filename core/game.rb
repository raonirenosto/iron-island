require "./core/language.rb"
require './core/screen.rb'
require './core/tip.rb'
require './core/string_utils.rb'
require './core/string.rb'
require './core/flow.rb'
# require './core/controller.rb'
require './core/game_symbol.rb'
require './core/output.rb'
# require './places/iron_island.rb'
# require './places/iron_village/iron_village.rb'
# require './places/iron_castle.rb'
# require './places/iron_forest.rb'
require './persona/player.rb'
require 'colorize'

module Game

  include Language
  include Screen
  include Tip
  include StringUtils
  include Output

  @@player
  @@game_symbol


  def set_language language
    load_language language
  end

  def new_game
    if not language_was_set?
      out "Language was not set!", :code_error
      return
    end
    @@player = Player.new
    @@game_symbol = GameSymbol.new
    @@game_symbol.action_symbols =
        {
          :level => { :commands => text("command_level") },
          :life => { :commands => text("command_life") },
          :get => { :commands => text("command_get") },
          :places => { :commands => text("command_places") },
          :go => { :commands => text("command_go") },
          :help => { :commands => text("command_help") },
          :exit => { :commands => text("command_exit") }
        }
    @@game_symbol.place_symbols =
        {
          :iron_castle => { :commands => text("command_iron_castle") },
          :iron_village => { :commands => text("command_iron_village") },
          :iron_forest => { :commands => text("command_iron_forest") }
        }
  end

  def player
    return @@player
  end

  def execute command

    # Extract all avaliable symbols
    symbol = @@game_symbol.extract_action_symbol command

    # Check if player typed any invalid command and print errors
    valid_command = validate_command symbol, command

    if not valid_command
      return
    end

    case symbol
    when :level
      out "show_level", :information, variable: @@player.level
    when :life
      out "show_hp", :information, variable: @@player.hp
    when :places
      show_places
    when :go
      place_symbol = @@game_symbol.extract_place_symbol command
      place = @@player.where_am_i.avaliable_place_by_symbol(place_symbol)
      go_to place
    when :help
      show_help
    when :exit
      out "show_exit", :information
      exit(true)
    end
  end

  def execute_loop
    loop do
      command = gets.chomp
      puts
      execute command
    end
  end

  def validate_command symbol, typed
    # Show error for invalid command
    if symbol == nil
      out "error_invalid_command", :error, "*"
      return false
    end

    # Get actual place
    place = @@player.where_am_i

    # Check if command is avaliable on location
    if (not place.avaliable_commands.include? symbol)
      out "error_unavalibale_command", :error
      return false
    end

    # Check if place is avaliable, if command is :go
    if symbol == :go
      place_symbol = @@game_symbol.extract_place_symbol typed
      place = @@player.where_am_i.avaliable_place_by_symbol(place_symbol)

      if place == nil
        out "error_invalid_place", :error, "*"
        return false
      end
    end

    return true
  end

  def show_places
    current_location = @@player.where_am_i
    out "show_places", :information
    current_location.avaliable_places.each do |place|
      puts place.name.green
    end
    puts
  end

  def show_help
    out "show_help", :information
    hash_commands = text "command_description"
    hash_commands.each do |key, text|
      puts key.light_blue + " = " +  text
    end
    puts
  end

  def go_to place
    @@player.set_place place
    place.go
  end
end
