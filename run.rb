require_relative 'iron_island.rb'
require_relative 'game.rb'

class Run
  include Game

  def start
    clear

    choose_language

    (IronIsland.instance).go
  end

  def choose_language
    hash_pt = ["pt","português","portugues","portuguese"]
    hash_en = ["en","inglês","ingles","english"]

    puts "Qual a sua língua? / What is your language?"

    until language_was_set?
      puts "Digite português ou inglês / Type english or portuguese".green
      puts
      command = gets.chomp.downcase

      if hash_pt.include? command
        set_language "pt"
      elsif hash_en.include? command
        set_language "en"
      else
        puts "Opção inválida / Invalid option".red
        puts
      end
    end
  end
end

Run.new.start
