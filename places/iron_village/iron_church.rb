require "singleton"
require_relative "../place"
require_relative "iron_village"

class IronChurch < Place
  include Singleton

  def go
    clear
    greetings
    show_menu
  end

  def greetings
    puts "O padre da Igreja de Ferro diz:\n".yellow,
      "Bem-vindo nobre senhor,".yellow,
         "em que posso ajudá-lo?".yellow
  end

  def show_menu
    puts ""
    puts "(1) - Conversar"
    puts "(2) - Comprar"
    puts "(3) - Até mais"

    get_menu_option
  end

  def show_talk_menu
    clear
    puts "O atendente diz: Qual assunto lhe interessa?".yellow
    puts ""
    puts "(1) - Igreja de Ferro"
    puts "(2) - Aldeões da Floresta de Ferro"
    puts "(3) - A Maldição Negra"
    puts "(4) - Voltar"

    get_talk_option
  end

  def show_buy_menu
    clear
    puts "O padre diz: O que gostaria de comprar?".yellow
    puts ""
    puts "(1) - Antídoto Contra Maldição Negra"
    puts "(2) - Voltar"

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
    when "3","até mais"
      say_goodbye "Obrigado pela nobre alma.",
       "Volte sempre!"
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
    when "1","igreja de ferro"
      talk_about_iron_church
    when "2","aldeões da floresta de ferro"
      talk_about_iron_forest_villagers
    when "3","a maldição negra"
      talk_about_the_black_curse
    when "4","voltar"
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
    when "1","antidoto contra maldição negra"
      buy
    when "2","voltar"
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
    show_buy_menu
  end

  def talk_about_iron_church
    clear
    puts "O padre diz:".yellow
    puts ""
    puts "A igreja de ferro é lugar certo para os fiéis do Vilarejo de",
          "Ferro encontrar a paz na ilha. Construída antes mesmo de existir ",
          " um vilarejo, a Igreja de Ferro aguentou guerras ao longo dos anos",
          " e continua indestrutível."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end

  def talk_about_iron_forest_villagers
    clear
    puts "O padre diz:".yellow
    puts ""
    puts "Existe uma tribo que habita a Floresta de Ferro. Tome muito cuidado",
         " pois ela pode ser bem agressiva quando algum forasteiro tenta cortar",
         " alguma de suas Árvores de Ferro."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end

  def talk_about_the_black_curse
    clear
    puts "O padre diz:".yellow
    puts ""
    puts 'Existe uma maldição que ataca os cavaleiros de ferro. Ela é chamada',
         ' de "A Maldição Negra". Ela consome a sua vida aos poucos até que',
         'não reste mais nenhum pingo de sua alma.'
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end
end
