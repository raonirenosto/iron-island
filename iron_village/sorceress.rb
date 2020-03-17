require "singleton"
require_relative "../place"
require_relative "iron_village"

class Sorceress < Place
  include Singleton

  def go
    clear
    greetings
    show_menu
  end

  def greetings
    puts "A Feiticeira diz: Em que o poder da magia pode ser útil?".yellow
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
    puts "O Feiticeira diz: Qual assunto lhe interessa meu caro?".yellow
    puts ""
    puts "(1) - Magia"
    puts "(2) - Balin"
    puts "(3) - Kandromus"
    puts "(4) - Voltar"

    get_talk_option
  end

  def show_buy_menu
    clear
    puts "O Feiticeira diz: Aqui estão meus itens:".yellow
    puts ""
    puts "(1) - Poção pequena"
    puts "(2) - Poção grande"
    puts "(3) - Magia de fogo"
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
      say_goodbye "Até mais, que a magia esteja com você."
      IronVillage.instance.go
    else
      puts @@MESSAGE.green
      self.get_talk_option
    end
  end

  def get_talk_option
    command = gets.chomp.downcase

    check command

    case command
    when "1","magia"
      talk_about_magic
    when "2" ,"balin"
      talk_about_balin
    when "3","kandromus"
      talk_about_kandromus
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
    when "1","poção pequena"
      buy
    when "2","poção grande"
      buy
    when "3","magia de fogo"
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

  def talk_about_magic
    clear
    puts "O Feiticeira diz:".yellow
    puts ""
    puts "O ferro é importante para o Reino de Ferro,"
    puts "mas somente a magia tem o poder de curar."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end

  def talk_about_balin
    clear
    puts "O Feiticeira diz:".yellow
    puts ""
    puts "Existe um monstro que vaga pela noite na Floresta de Ferro."
    puts "Os nativos o chamam de Balin, o monstro da floresta."
    puts "Monstros da noite temem o fogo."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end

  def talk_about_kandromus
    clear
    puts "O Feiticeira diz:".yellow
    puts ""
    puts "Kandromus já tentou várias vezes tomar para si o Reino de Ferro, mas fracassou miseravelmente."
    puts "Eu temo que Kandromus esteja experimentando magias proibidas com os 5 elementos."
    puts "Magias estas que ultrapassam a fronteira do que é conhecido no Reino de Ferro."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end
end
