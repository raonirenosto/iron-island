require "singleton"
require "colorize"
# require_relative "../place"
# require_relative "blacksmith"
# require_relative "sorceress"
# require_relative "iron_market"
# require_relative "iron_house"
# require_relative "iron_church"
# require_relative "iron_knight_order"
# require_relative "iron_horse_stable"

class IronVillage 
  include Singleton

  def go
    clear
    greetings
    # show_menu
    # get_user_option
  end

  def greetings
    puts "A placa do Vilarejo de Ferro diz:"
    puts ""
    puts "Bem-vindo a Vila de Ferro".yellow
    puts ""
    puts "Aqui vocês encontrará mercadorias e mercadores de todo o reino."
    puts "Fique a vontade para perambular pela vila meu caro forasteiro,"
    puts "mas para os baderneiros estamos atentos também, sob a proteção"
    puts "do rei e dos cavaleiros de ferro."
  end

  def show_menu
    puts ""
    puts "Para onde gostaria de ir?".green
    puts ""
    puts "(1) - Ferreiro"
    puts "(2) - Feiticeira"
    puts "(3) - Mercado de Ferro"
    puts "(4) - Casa de Ferro"
    puts "(5) - Igreja de Ferro"
    puts "(6) - Ordem dos Cavaleiros de Ferro"
    puts "(7) - Estábulo Cavalo de Ferro"
  end

  def get_user_option
    command = gets.chomp.downcase

    check command

    case command
    when "1","ferreiro"
      Blacksmith.instance.go
    when "2","feiticeira"
      Sorceress.instance.go
    when "3","mercado de ferro"
      IronMarket.instance.go
    when "4","casa de ferro"
      IronHouse.instance.go
    when "5","igreja de ferro"
      IronChurch.instance.go
    when "6","ordem dos cavaleiros de ferro"
      IronKnightOrder.instance.go
    when "7","estábulo cavalo de ferro"
      IronHorseStable.instance.go
    else
      puts ""
      puts @@MESSAGE.green
      get_user_option
    end
  end
end
