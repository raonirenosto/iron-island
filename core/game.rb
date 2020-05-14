require "./core/language.rb"
require './core/screen.rb'
require './core/tip.rb'
require './core/string_utils.rb'
require './core/string.rb'
require './core/flow.rb'
# require './core/controller.rb'
require './core/game_symbol.rb'
require './core/output.rb'
require './places/iron_island.rb'
# require './places/iron_village/iron_village.rb'
# require './places/iron_castle.rb'
# require './places/iron_forest.rb'
require './persona/player.rb'
require 'colorize'

class Game

  include Language
  include Screen
  include Tip
  include StringUtils
  include Output
  # include Flow
  # include Controller

  # Controller should be included after tutorial refactor

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
  end

  def player
    return @@player
  end

  def execute command

    # Extract all avaliable symbols
    symbol = @@game_symbol.extract_action_symbol command

    # Check if player typed any invalid command
    check_for_errors symbol

    case symbol
    when :level
      out "show_level", :information, variable: @@player.level
    when :life
      out "show_hp", :information, variable: @@player.hp
    when :places
      show_places
    when :exit
      out "show_exit"
      exit(true)
    end

  end

  def check_for_errors symbol
    # Show error for invalid command
    if symbol == nil
      out "error_invalid_command", :error, "*"
      return
    end

    # Get actual place
    place = @@player.where_am_i

    # Check if command is avaliable on location
    if (not place.avaliable_commands.include? symbol)
      out "error_unavalibale_command", :error
      return
    end
  end

  def show_places
    current_location = @@player.where_am_i
    out "show_places"
    current_location.avaliable_places.each do |place|
      puts place.name.yellow
    end
    puts
  end

  def go place
    place.set_place place
  end

  def iron_village
    IronVillage.instance
  end

  def iron_island
    IronIsland.instance
  end

  def iron_forest
    IronForest.instance
  end

  def iron_castle
    IronCastle.instance
  end
end
