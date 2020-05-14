require "./core/language.rb"
require "colorize"

module Output

  def out(key, type= :normal, replace= nil, variable:nil)
    if (type == :code_error)
      puts key.red
      return
    end

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
      puts text_with_var(key, variable).light_blue
    end
    puts
  end
end
