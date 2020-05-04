require_relative "utils/language.rb"
require_relative 'utils/screen.rb'
require_relative 'utils/controller.rb'
require 'colorize'

module Game
  @@tips = true

  include Language
  include Screen
  include Controller

  def tips key, need_split=true
    full_text = text(key)
    if need_split
      splited_text = full_text.split('*')
      full_text = splited_text[0].green + splited_text[1].blue + splited_text[2].green
    end
    puts text("tips_label").green + " - " + full_text
  end

  def change_symbol_color orginal_text, text_color, symbol_color
    splited_text = orginal_text.split('*')
    before_symbol = splited_text[0].send(text_color)
    symbol =  splited_text[1].send(symbol_color)
    after_symbol = splited_text[2].send(text_color)
    return before_symbol + symbol + after_symbol
  end

  def tips?
    @@tips
  end

  def show_tips
    @@tips = true
  end

  def hide_tips
    @@tips = false
  end
end
