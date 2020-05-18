class Menu
  include Game

  def show_menu
    begin
      show_avaliable_commands
      command = gets.chomp
      symbol = game_symbol.extract_menu_symbol command

      if symbol == nil
        puts
        out "error_invalid_menu_option", :error
        puts
        next
      end

      case symbol
      when :talk
        show_talk
      when :buy
        show_buy
      when :sell
        show_sell
      when :quest
        show_quest
      end
      puts
    end while symbol != :exit
    exit_menu
  end

  def show_avaliable_commands
    puts "Opções disponíveis:".light_blue
    puts
    avaliable_commands.each do |symbol|
      name = game_symbol.symbol_name symbol
      puts name.green
    end
    puts
  end

  def show_talk
  end

  def show_buy
  end

  def show_sell
  end

  def show_quest
  end

  def avaliable_commands
    return [:exit]
  end

  def exit_menu
  end
end
