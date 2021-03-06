require "./core/game.rb"
require "./core/factory.rb"

class Run

  include Game

  def start
    clear
    # choose_language

    set_language "pt"
    new_game
    # new_game
    # start_controller
    iron_island = Factory.instance.iron_island

    go_to iron_island
  end

  # def choose_language
  #   hash_pt = ["pt","português","portugues","portuguese"]
  #   hash_en = ["en","inglês","ingles","english"]
  #
  #   puts "Qual a sua língua? / What is your language?"
  #
  #   until language_was_set?
  #     puts "Digite português ou inglês / Type english or portuguese".green
  #     puts
  #     command = gets.chomp.downcase
  #
  #     if hash_pt.include? command
  #       set_language "pt"
  #     elsif hash_en.include? command
  #       set_language "en"
  #     else
  #       puts "Opção inválida / Invalid option".red
  #       puts
  #     end
  #   end
  # end
end

Run.new.start
