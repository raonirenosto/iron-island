require "singleton"
require_relative "../place"
require_relative "iron_village"

class Blacksmith < Place
  include Singleton

  def go
    clear
    greetings
    show_menu
  end

  def greetings
    puts "O Ferreiro diz: Olá aldeão, em que posso ajudá-lo?".yellow
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
    puts "O Ferreiro diz: Sobre o que estaria interessado?".yellow
    puts ""
    puts "(1) - O Ferreiro"
    puts "(2) - A Feiticeira"
    puts "(3) - Voltar"

    get_talk_option
  end

  def show_buy_menu
    clear
    puts "O Ferreiro diz: O que quer comprar?".yellow
    puts ""
    puts "(1) - Machado"
    puts "(2) - Porrete de Ferro"
    puts "(3) - Espada"
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
      say_goodbye "Obrigado pela visita aldeão.",
       "Quando precisar de uma boa espada, passer por aqui!"
      IronVillage.instance.go
    else
      puts ""
      puts @@MESSAGE.green
      self.get_menu_option
    end
  end

  def get_talk_option
    command = gets.chomp.downcase

    check command

    case command
    when "1","ferreiro"
      talk_about_blacksmith
    when "2","feiticeira"
      talk_about_sorceress
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
    when "1","machado"
      buy
    when "2","porrete de ferro"
      buy
    when "3","espada"
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

  def talk_about_sorceress
    clear
    puts "O Ferreiro diz:".yellow
    puts ""
    puts "Se você precisar de poções mágicas vá até a Feiticeira,"
    puts "mas tome cuidado! Muitas magias praticadas por ela não"
    puts "me agradam. Nunca confiei nessa bruxa."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end

  def talk_about_blacksmith
    clear
    puts "O Ferreiro diz:".yellow
    puts ""
    puts "O Reino de Ferro possui vários ferreiros habilidosos,"
    puts "mas modéstia a parte, entre eles eu sou o melhor."
    puts "A minha arte de forjar espadas é conhecida nos quatro cantos da ilha."
    puts ""
    puts "Aperte qualquer botão para continuar...".green
    gets.chomp
    show_talk_menu
  end
end
