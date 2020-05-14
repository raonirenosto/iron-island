# require './places/iron_island.rb'
# require_relative 'game.rb'
require "./core/game.rb"

class Run

  def start
    # clear
    # choose_language

    game = Game.new
    game.set_language "pt"
    game.new_game
    # new_game
    # start_controller

    iron_land = game.iron_island

    game.go iron_land
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
