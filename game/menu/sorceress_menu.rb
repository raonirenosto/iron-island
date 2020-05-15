require "./game/menu/menu.rb"

class SorceressMenu < Menu

  def avaliable_commands
    [:talk, :buy, :sell, :task] + super
  end

  def show_talk
    talk_options = ["magia", "balin", "kandromus"]
    talk_options << (game_symbol.symbol_name :back)

    begin
      show_options talk_options

      command = gets.chomp.downcase

      symbol = game_symbol.extract_menu_symbol command

      if (symbol != nil) && (symbol == :back)
        return
      end

      if not talk_options.include? command
        puts
        out "error_invalid_menu_option", :error
        next
      end

      puts
      case command
      when "magia"
        talk_magic
      when "balin"
        talk_balin
      when "kandromus"
        talk_kandromus
      end

    end while symbol != :back
  end

  def talk_magic
    out "sorceress_says", :speak_say
    out "sorceress_talk_magic", :speak_text
    wait_until_type
  end

  def talk_balin
    out "sorceress_says", :speak_say
    puts "Talk about balin..".green
    puts
    wait_until_type
  end

  def talk_kandromus
    out "sorceress_says", :speak_say
    puts "Talk about kandromus..".green
    puts
    wait_until_type
  end

  def show_options options
    puts
    puts "Opções disponíveis:".light_blue
    puts
    options.each do |name|
      puts name.green
    end
    puts
  end
end
