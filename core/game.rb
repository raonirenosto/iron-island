require "./core/language.rb"
require './core/screen.rb'
require './core/tip.rb'
require './core/string_utils.rb'
require './core/string.rb'
require './core/flow.rb'
require './core/game_symbol.rb'
require './core/output.rb'
require './persona/player.rb'
require 'colorize'

module Game

  include Language
  include Screen
  include Tip
  include StringUtils
  include Output
  include Flow

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
          :quests => { :commands => text("command_quests") },
          :actions => { :commands => text("command_actions") },
          :coins => { :commands => text("command_coins") },
          :search =>  {
                        :commands => text("command_search") ,
                        :name => text("command_search_name")
                      },
          :exit =>    {
                        :commands => text("command_exit"),
                        :name => text("command_exit_name")
                      }
        }
    @@game_symbol.place_symbols =
        {
          :iron_castle => { :commands => text("command_iron_castle") },
          :iron_village => { :commands => text("command_iron_village") },
          :iron_forest => { :commands => text("command_iron_forest") },
          :sorceress => { :commands => text("command_sorceress") },
          :dark_swamp => { :commands => text("command_dark_swamp") }
        }
    @@game_symbol.menu_symbols =
        {
          :talk =>  {
                      :commands => text("command_talk"),
                      :name =>  text("command_talk_name")
                    },
          :buy =>   {
                      :commands => text("command_buy"),
                      :name =>  text("command_buy_name")
                    },
          :sell =>  {
                      :commands => text("command_sell"),
                      :name =>  text("command_sell_name")
                    },
          :quest =>  {
                      :commands => text("command_quest"),
                      :name => text("command_quest_name")
                    },
          :exit =>  {
                      :commands => text("command_exit"),
                      :name => text("command_exit_name")
                    },
          :back =>  {
                      :commands => text("command_back"),
                      :name => text("command_back_name")
                    }
        }

      @@game_symbol.quest_symbols =
          {
            :quest_herb =>  {
                        :commands => text("command_quest_herb"),
                        :name =>  text("command_quest_herb_name")
                      },
            :quest_herb_finish =>  {
                        :commands => text("command_quest_herb_finish"),
                        :name =>  text("command_quest_herb_name_finish")
                      }

          }
      @@game_symbol.item_symbols =
          {
            :magic_herbs =>  {
                        :commands => text("command_item_magic_herb"),
                        :name =>  text("command_item_magic_herb_name")
                      }
          }

  end

  def game_symbol
    return @@game_symbol
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
    when :quests
      show_quests
    when :get
      handle_get command
    when :actions
      show_actions
    when :search
      item_symbol = @@game_symbol.extract_item_symbol command
      @@player.where_am_i.search item_symbol
    when :coins
      out "show_coins", :information, variable: @@player.coins
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

    # Check if can search item, if command is :search
    if symbol == :search
      item_symbol = @@game_symbol.extract_item_symbol typed

      current_place = @@player.where_am_i

      item = get_object_by_symbol(item_symbol, current_place.avaliable_searchs)

      if item == nil
        out "error_invalid_search", :error, "*"
        return false
      end
    end

    if symbol == :get
      if composed_command? typed, text("command_get")
        item_symbol = @@game_symbol.extract_item_symbol typed
        current_place = @@player.where_am_i

        item = get_object_by_symbol(item_symbol, current_place.avaliable_items)

        if item == nil
          out "error_invalid_item", :error, "*"
          return false
        end
      end
    end

    return true
  end

  # Return true if is a composed command Ex: go some_place
  # Return false for single command Ex: go
  def composed_command? typed, commands
    results = commands.select { |command| command != typed }
    return results.count == commands.count
  end

  def get_object_by_symbol symbol, list
    list.each do |item|
      if item.symbol == symbol
        return item
      end
    end
    return nil
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

  def show_coins

  end

  def go_to place
    @@player.set_place place
    place.go
  end

  def show_quests
    out "show_quests", :information
    @@player.quests.each do |quest|
      puts quest.name.blue + ": ".blue  + quest.description.yellow
    end
    if @@player.quests.size == 0
      puts text("show_quests_no_mission").yellow
    end
    puts
  end

  def show_actions
    current_location = @@player.where_am_i
    out "show_actions", :information
    current_location.avaliable_actions.each do |key, value|
      action_name = @@game_symbol.symbol_name value[:action]
      item_name = @@game_symbol.symbol_name value[:item]
      puts action_name.green + " " + item_name.downcase.green
    end
    puts
  end

  def handle_get command
    if composed_command? command, text("command_get")
      handle_get_item command
    else
      show_items
    end
  end

  def show_items
    current_location = @@player.where_am_i
    if current_location.avaliable_items.size == 0
      out "show_items_no_item_around", :information
      return
    end
    out "show_items", :information
    current_location.avaliable_items.each do |item|
      puts item.name.green
    end
    puts
  end

  def handle_get_item command
    item_symbol = @@game_symbol.extract_item_symbol command
    current_place = @@player.where_am_i

    item = current_place.avaliable_item_by_symbol item_symbol

    current_place.get item
  end


  def start_quest quest
    @@player.start_quest quest
  end

  def delay
    sleep(1)
  end
end
