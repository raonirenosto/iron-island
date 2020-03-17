require "singleton"
require_relative "place"
require_relative "iron_village/iron_village.rb"
require_relative "menu"

class IronIsland < Place
  include Singleton

  def name
    "Ilha de Ferro"
  end

  def go
    clear
    greetings
    show_menu
    get_user_option
  end

  def greetings
    puts "Na placa do cais da Ilha de Ferro está escrito:"
    puts ""
    puts "Bem-vindo a Ilha de Ferro,".yellow
    puts
    puts "o reino forjado por bravos cavaleiros,"
    puts "aproveite a sua viagem, mas cuidado com os lugares que visita"
    puts "o Reino de Ferro pode apresentar várias surpresas."
  end

  def show_menu
    puts ""
    puts "Para onde gostaria de ir?".green
    puts ""
    puts "(1) - Vilarejo de Ferro"
    puts "(2) - Castelo de Ferro"
    puts "(3) - Floresta de Ferro"
  end

  def get_user_option
    command = gets.chomp.downcase

    check command

    case command
    when "1", "vilarejo de ferro"
      IronVillage.instance.go
    else
      puts ""
      puts @@MESSAGE.green
      self.get_buy_option
    end
  end

  # def start
  #   iron_village = IronVillage.new
  #   go iron_village
  # end
  #
  # def go place
  #
  #   # Show specific place welcome message
  #   place.welcome
  #
  #   place.menu.show
  #
  #   user_interaction place.menu
  # end
  #
  # def user_interaction menu
  #   # Get user option
  #   user_command = gets.chomp
  #
  #   # Go to previous menu
  #   if (!menu.root? &&
  #       (user_command == "voltar" ||
  #       user_command == "v" ))
  #     go menu.father.place
  #     return
  #   end
  #
  #   menu_item = menu.get_option user_command
  #
  #   if menu_item == nil
  #     puts "não, essa opção não existe"
  #     menu.show
  #     user_interaction menu
  #   else
  #     if menu_item.place?
  #       go menu_item.place
  #     end
  #     if menu_item.interactive?
  #       menu_item.father.place.show_menu_question
  #       menu_item.show
  #       user_interaction menu_item
  #     end
  #     if menu_item.talk?
  #       menu_item.place.talk menu_item
  #     end
  #   end
  # end
end
