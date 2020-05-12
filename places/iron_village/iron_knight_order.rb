require "singleton"
require_relative "../place"
require_relative "iron_village"

class IronKnightOrder < Place
  include Singleton

  def go
    clear
    greetings
    show_menu
  end

  def greetings
    puts "Um cavaleiro da ordem diz:\n".yellow,
      "Bem-vindo à Ordem dos Cavaleiro de Ferro,".yellow
  end

  def show_menu
    puts ""
    puts "(1) - Conversar"
    puts "(2) - Mais"
    puts "(3) - Até mais"

    get_menu_option
  end

  def show_talk_menu
    clear
    puts "O Cavaleiro da Ordem diz: Sobre o que estaria interessado?".yellow
    puts ""
    puts "(1) - Ordem dos Cavaleiros de Ferro"
    puts "(2) - Competição dos Cavaleiros de Ferro"
    puts "(3) - Treinamento"
    puts "(4) - Aldeões da Floresta de Ferro"
    puts "(5) - Voltar"

    get_talk_option
  end

  def show_more_menu
    clear
    puts "O cavaleiro diz: O que deseja fazer?".yellow
    puts ""
    puts "(1) - Competição dos Cavaleiros de Ferro"
    puts "(2) - Treinamento"
    puts "(3) - Voltar"

    get_buy_option
  end

  def get_menu_option
    command = gets.chomp.downcase

    check command

    case command
    when "1","conversar"
      show_talk_menu
    when "2","mais"
      show_more_menu
    when "3","até mais"
      say_goodbye "Até mais."
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
    when "1","ordem dos cavaleiros de ferro"
      talk_about_iron_knight_order
    when "2","competição dos cavaleiros de ferro"
      talk_about_iron_knight_context
    when "3","comprar no mercado de ferro"
      talk_about_training
    when "4","vender no mercado de ferro"
      talk_about_villagers_of_iron_forest
    when "5","voltar"
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
    when "1","competição dos cavaleiros de ferro"
      buy
    when "2","treinamento"
      buy
    when "3","voltar"
      go
    else
      puts ""
      puts @@MESSAGE.green
      self.get_buy_option
    end
  end

  def buy
    puts ""
    puts "Should buy something...".green
    gets
    show_more_menu
  end

  def talk_about_iron_knight_order
    clear
    puts "O cavaleiro diz:".yellow
    puts ""

    puts "A ordem dos Cavaleiros de Ferro é uma instituição milenar. A principal função da ordem é proteger o reino de ferro e treinar cavaleiros para que se tornem Cavaleiros de Ferro."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end

  def talk_about_iron_knight_context
    clear
    puts "O cavaleiro diz:".yellow
    puts ""
    puts "Competição feita para premiar o melhor cavaleiro. O cavaleiro que ganhar a competição, tem o direito de entrar na Ordem dos Cavaleiros de Ferro."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end

  def talk_about_training
    clear
    puts "O cavaleiro diz:".yellow
    puts ""
    puts "Treinamento para aldeões que querem virar cavaleiros. Para fazer o treinamento, o cavaleiro deve possuir uma espada."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end

  def talk_about_villagers_of_iron_forest
    clear
    puts "O cavaleiro diz:".yellow
    puts ""
    puts "Tome cuidado com os aldeões da Floresta de Ferro. Eles possuem vários níveis e categoria de guerreiros."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end
end
