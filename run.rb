require_relative "iron_island"

class Run

  def start
    iron_island = IronIsland.instance
    iron_island.go
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
