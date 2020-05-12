require "singleton"
require_relative "../place"
require_relative "iron_village"

class IronHouse < Place
  include Singleton

  def go
    clear
    greetings
    show_menu
  end

  def greetings
    puts "O atendente da Casa de Ferro diz:\n".yellow,
      "Bem-vindo a Casa de Ferro,".yellow,
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
    puts "(1) - Casa de Ferro"
    puts "(2) - Taverna do Punho de Ferro"
    puts "(3) - Voltar"

    get_talk_option
  end

  def show_buy_menu
    clear
    puts "O atendente diz: Gostaria de pernoitar?".yellow
    puts ""
    puts "(1) - Pernoitar"
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
      say_goodbye "Obrigado pela visita senhor.",
       "Volte sempre a Casa de Ferro!"
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
    when "1","casa de ferro"
      talk_about_iron_house
    when "2","taverna punho de ferro"
      talk_about_iron_fist_tavern
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
    when "1","pernoitar"
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

  def talk_about_iron_house
    clear
    puts "O atendente diz:".yellow
    puts ""
    puts "A casa de ferro é o lugar ideal para passar a noite ou se abrigar"
    puts "durante uma nevasca."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end

  def talk_about_iron_fist_tavern
    clear
    puts "O atendente diz:".yellow
    puts ""
    puts "Se você quer relaxar durante a sua estadia no Vilarejo de Ferro, a Taverna "
    puts "Punho de Ferro é o lugar ideal para você, muito hidromel, garotas bonitas e"
    puts "é claro, uma briga ou outra com os bêbados da taverna."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end
end
