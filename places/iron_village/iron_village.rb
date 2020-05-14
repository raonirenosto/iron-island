require "singleton"
require "./core/game.rb"
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
  # include Game

  def go
    clear
    greetings
    # show_menu
    # get_user_option
  end

  def greetings
    puts text "iron_village_sign_says"
    puts text("iron_village_welcome").green
    print_long_text text("iron_village_sign2").green
    puts
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

  def avaliable_commands
    return [ :go, :level, :life, :help, :exit, :places ]
  end

  def avaliable_places
    [ :iron_forest, :iron_castle]
  end

  def name
    return text("iron_village_name")
  end
end
