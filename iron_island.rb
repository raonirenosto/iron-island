require_relative 'game.rb'
require_relative 'game/tutorial.rb'
require './core/controller.rb'
require "singleton"

class IronIsland
  include Singleton
  include Game
  include Controller

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

    command = ""
    loop_for_command
    # begin
    #   command = loop_for_command
    # end while is_not(command, :go)
  end

  def loop_for_command
    command = ""

    while true
      command = gets.chomp
      puts
      #
      # unavaliable_command = is_native_command?(command) &&
      #   is_not_avaliable_command?(command, avaliable_commands)
      #
      # if unavaliable_command
      #   puts "Este comando não está disponível neste lugar".yellow
      #   puts
      # end
      #
      # if is_not_native_command?(command)
      #   print_long_text change_symbol_color "Comando não suportado. Digite *ajuda* para saber os comandos disponíveis",
      #     :green, :blue
      #   puts
      # end
      #
      # if is(command, :go) && can_not_go_to_h(command, avaliable_places)
      #   puts "Não é possivel ir para este lugar".yellow
      #   puts
      # end
      #
      # if can_go_to_h(command, avaliable_places)
      #   return command
      # end

      # if is_avaliable_command?(command,avaliable_commands)
        execute command
      # end
    end
  end

  def avaliable_commands
    [ :go, :level, :life, :help, :exit, :places ]
  end

  def avaliable_places
    [ :iron_village, :iron_forest, :iron_castle]
  end
end
