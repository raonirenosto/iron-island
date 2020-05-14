require './core/factory.rb'
require './core/game.rb'
require './places/place.rb'

class IronIsland < Place
  include Game

  def go
    land
  end

  def land
    clear
    # puts  text("iron_island_welcome")
    # puts
    # print_long_text text("iron_island_information").yellow
    # puts
    # wait_until_type
    #
    # tutorial = Tutorial.new
    # tutorial.ask_for_tutorial

    start_game
  end

  def start_game
    clear
    exploring_text = change_symbol_color text("iron_island_start_exploring"), :white, :blue
    print_long_text exploring_text
    tips "tips_places"
    puts

    execute_loop
  end

  def avaliable_commands
    super + [ :go, :level, :life, :places ]
  end

  def avaliable_places
    iron_village = Factory.instance.iron_village
    iron_castle = Factory.instance.iron_castle
    iron_forest = Factory.instance.iron_forest
    [ iron_village, iron_castle, iron_forest ]
  end

  def name
    text("iron_island_name")
  end
  def symbol
    :iron_island
  end
end
