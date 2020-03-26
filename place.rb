require_relative "game"
class Place < Game

  @@MESSAGE = "Comando inválido, digite novamente uma opção válida:"

  def clear
    # clean console
    puts "\e[H\e[2J"
  end

  def check command
    if command == "sair"
      puts ""
      puts "Até logo forasteiro...".yellow
      puts ""
      puts "Pressione qualquer tecla para continuar...".green
      gets
      exit
    end
  end

  def say_goodbye *args
    args.each do |message|
      puts message.yellow
    end
    puts ""
    puts "Pressione qualquer tecla para continuar...".green
    gets
  end
end
