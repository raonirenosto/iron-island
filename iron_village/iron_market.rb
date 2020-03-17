require "singleton"
require_relative "../place"
require_relative "iron_village"

class IronMarket < Place
  include Singleton

  def go
    clear
    greetings
    show_menu
  end

  def greetings
    puts "Uma camponesa que está no balcão diz: Olá senhor, em que posso ajudá-lo?".yellow
  end

  def show_menu
    puts ""
    puts "(1) - Conversar"
    puts "(2) - Comprar"
    puts "(3) - Vender"
    puts "(4) - Até mais"

    get_menu_option
  end

  def show_talk_menu
    clear
    puts "A camponesa diz: Sobre o que estaria interessado?".yellow
    puts ""
    puts "(1) - Mercado de Ferro"
    puts "(2) - Cavaleiros de Ferro"
    puts "(3) - Voltar"

    get_talk_option
  end

  def show_buy_menu
    clear
    puts "A camponesa diz: O que quer comprar senhor?".yellow
    puts ""
    puts "(1) - Capacete"
    puts "(2) - Armadura"
    puts "(3) - Botas"
    puts "(4) - Luvas"

    get_buy_option
  end

  def get_menu_option
    command = gets.chomp.downcase

    check command

    case command
    when "1","conversar"
      show_talk_menu
    when "2","comprar"
      show_buy_menu
    when "3","vender"
      show_sell_menu
    when "4","até mais"
      say_goodbye "Obrigado pela visita senhor.",
       "O Mercado de Ferro agradece a preferência"
      IronVillage.instance.go
    else
      puts ""
      puts @@MESSAGE.green
      get_menu_option
    end
  end

  def get_talk_option
    command = gets.chomp.downcase

    check command

    case command
    when "1","mercado de ferro"
      talk_about_iron_market
    when "2","cavaleiros de ferro"
      talk_about_iron_knights
    when "3","voltar"
      go
    else
      puts ""
      puts @@MESSAGE.green
      self.get_talk_option
    end
  end

  def get_buy_option
    command = gets.chomp.downcase

    check command

    case command
    when "1","capacete"
      buy
    when "2","armadura"
      buy
    when "3","botas"
      buy
    when "4","luvas"
      go
    else
      puts ""
      puts @@MESSAGE.green
      self.get_buy_option
    end
  end

  def show_sell_menu
    puts ""
    puts "Should sell something...".green
    gets
    show_menu
  end

  def buy
    puts ""
    puts "Should buy something...".green
    gets
    show_buy_menu
  end

  def talk_about_iron_market
    clear
    puts "A camponesa diz:".yellow
    puts ""
    puts "O Mercado de Ferro é o maior mercado da Ilha de Ferro."
    puts "Cavaleiros de toda a região vem ao mercado para comprar armaduras, capacetes e outros utensílios."
    puts "Temos orgulho de fornecer armaduras para os Cavaleiros da Ordem."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end

  def talk_about_iron_knights
    clear
    puts "A camponesa diz:".yellow
    puts ""
    puts "Cavaleiros de Ferro ou Cavaleiros da ordem são aqueles cavaleiros que "
    puts "ganharam a Competição dos Cavaleiros da Ordem."
    puts "Somos muito gratos aos Cavaleiros de Ferro por defender a nossa vila."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end
end
