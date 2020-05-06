require_relative 'game.rb'
require_relative 'game/tutorial.rb'
require "singleton"

class IronIsland
  include Singleton
  include Game

  def go
    land
  end

  def land
    clear
    puts  text("iron_island_welcome")
    puts
    print_long_text text("iron_island_information").yellow
    puts
    wait_until_type

    tutorial = Tutorial.new
    tutorial.ask_for_tutorial

    start_game
  end

  def start_game
    clear
    exploring_text = change_symbol_color text("iron_island_start_exploring"), :white, :blue
    print_long_text exploring_text
    tips "tips_places"
    puts
    command = gets.chomp
  end
end
