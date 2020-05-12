require "singleton"
require_relative "../place"
require_relative "iron_village"

class IronHorseStable < Place
  include Singleton

  def go
    clear
    greetings
    show_menu
  end

  def greetings
    puts "O atendente diz:\n".yellow,
      "Bem-vindo ao Estábulo Cavalo de Ferro".yellow
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
    puts "(1) - Estábulo do Cavalo de Ferro"
    puts "(2) - Cavalos de Ferro"
    puts "(3) - Voltar"

    get_talk_option
  end

  def show_buy_menu
    clear
    puts "O atendente diz: O que gostaria de comprar?".yellow
    puts ""
    puts "(1) - Cavalo de Aldeão"
    puts "(2) - Cavalo de Ferro"
    puts "(3) - Cavalo Negro"
    puts "(4) - Voltar"

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
       "Volte sempre ao Estábulo Cavalo de Ferro!"
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
    when "1","estábulo do cavalo de ferro"
      talk_about_iron_horse_stable
    when "2","cavalo de ferro"
      talk_about_iron_horse
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
    when "1","cavalo de aldeão"
      buy
    when "2","cavalo de ferro"
      buy
    when "3","cavalo negro"
      buy
    when "4","voltar"
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

  def talk_about_iron_horse_stable
    clear
    puts "O atendente diz:".yellow
    puts ""
    puts "O Estábulo Cavalo de Ferro é o lugar aonde você encontrar os melhores cavalos pelos melhores preços!"
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end

  def talk_about_iron_horse
    clear
    puts "O atendente diz:".yellow
    puts ""
    puts "Um Cavalo de Ferro é essencial para um Cavaleiro de Ferro. É como a sua espada e seu escudo, sem as ferramentas necessárias um cavaleiro está vulnerável. Não queira encontrar um Cavaleiro de Ferro Negro sem estar montado em um bom cavalo."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end
end
