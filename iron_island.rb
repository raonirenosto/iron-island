require_relative 'game.rb'
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
    introduce_gammel
  end

  def introduce_gammel
    clear
    puts text("iron_island_gammel_says")
    print_long_text text("iron_island_gammel_txt_1").yellow
    puts
    puts text("iron_island_gammel_says")
    print_long_text text("iron_island_gammel_txt_2").yellow
    puts
    puts text("iron_island_gammel_says")
    puts text("iron_island_gammel_tips").yellow
    print_long_text text("iron_island_start_tutorial_question").green
    puts

    yes_no_question(method(:show_tutorial), method(:skip_tutorial)) {
        puts text("iron_island_gammel_says")
        puts text("iron_island_gammel_unknown_answer").yellow
        print_long_text text("iron_island_start_tutorial_question").green
        puts
    }
  end

  def skip_tutorial
    puts
    puts text("iron_island_gammel_says").white
    print_long_text text("iron_island_gammel_no_tutorial").yellow
    wait_until_type
    show_places
  end

  def show_tutorial
    puts "=== skip tutorial"
  end

  def show_places
    clear
    exploring_text = change_symbol_color text("iron_island_start_exploring"), :white, :blue
    print_long_text exploring_text
    tips "tips_places"
    puts
    command = gets.chomp
  end

  # def greetings
  #   puts "Na placa do cais da Ilha de Ferro está escrito:"
  #   puts ""
  #   puts "Bem-vindo a Ilha de Ferro,".yellow
  #   puts
  #   puts "o reino forjado por bravos cavaleiros,"
  #   puts "aproveite a sua viagem, mas cuidado com os lugares que visita"
  #   puts "o Reino de Ferro pode apresentar várias surpresas."
  # end
  #
  # def show_menu
  #   puts ""
  #   puts "Para onde gostaria de ir?".green
  #   puts ""
  #   puts "(1) - Vilarejo de Ferro"
  #   puts "(2) - Castelo de Ferro"
  #   puts "(3) - Floresta de Ferro"
  # end
end
