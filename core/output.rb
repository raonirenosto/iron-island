require "./core/language.rb"
require "colorize"

module Output

  def out(key, type= :normal, replace= nil, variable: nil)
    if (type == :code_error)
      puts key.red
      return
    end

    break_line = true
    text_to_print = text(key)
    case type
    when :normal
      if (replace != nil)
        puts change_symbol_color(text_to_print, :green, :blue)
      else
        puts text_to_print.green
      end
    when :error
      if (replace != nil)
        puts change_symbol_color(text_to_print, :yellow, :blue)
      else
        puts text_to_print.yellow
      end
    when :information
      if variable == nil
        puts text_to_print.light_blue
      else
        puts text_with_var(key, variable).light_blue
      end
    when :information_highlight
      puts change_symbol_color(text_to_print, :light_blue, :yellow)
    when :speak_say
      puts text_to_print.light_white
      break_line = false
    when :speak_text
      puts text_to_print.green
    else
      puts "Type #{type} is not valid".red
      return
    end

    puts if break_line
  end
end
