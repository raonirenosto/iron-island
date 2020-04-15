# require_relative "iron_island"
require_relative "menu/menu.rb"
# require 'yaml'

class Run

  def start

    menu = Menu.new
    menu.clear
    menu.place = "blacksmith"
    menu.origin = self

    menu.show_menu

    # iron_island = IronIsland.instance
    # iron_island.go
  end

  def go_back
    puts "Go back"
  end

  # def go place
  #   # clean console
  #   puts "\e[H\e[2J"
  #
  #   place.greetings
  #
  #   place.show_menu
  #
  #   # Get user command
  #   user_option = gets.chomp
  #
  #   if place.menu.include? user_option
  #
  #     option = place.menu.get_option user_option
  #
  #     if option.choose?
  #       option.action.call
  #       go option.place
  #     end
  #
  #     if option.talk?
  #       place.talk option
  #     end
  #
  #     if option.buy?
  #       place.buy option
  #     end
  #
  #     if option.travel?
  #       go option.place
  #     end
  #   else
  #     puts "Esta opção não existe"
  #     go place
  #   end
  # end
end

Run.new.start
