require './core/string.rb'

module StringUtils

  def change_symbol_color orginal_text, text_color, symbol_color
    splited_text = orginal_text.split('*')
    before_symbol = splited_text[0].send(text_color)
    symbol =  splited_text[1].send(symbol_color)
    after_symbol = splited_text[2].send(text_color)
    return before_symbol + symbol + after_symbol
  end

  #
  # Change color of words that have a symbol
  # Ex: "I whant *yellow* to be yellow"
  #  change_words_color yellow_text, "*", :white, :yellow
  #
  def change_words_color text, symbol, text_color, symbol_color

    splited_text = text.split(/#{Regexp.escape(symbol)}(.*?)#{Regexp.escape(symbol)}/m)
    puts splited_text
    result_text = ""

    # splited_text.each do |partial_text|
    #   partial_text = partial_text.strip
    #   puts partial_text.strip
    #   if partial_text.include? symbol
    #     result_text += partial_text.between(symbol, symbol).send(symbol_color)
    #   else
    #     result_text += partial_text.send(text_color)
    #   end
    # end

    # puts result_text

    # result_text = ""
    # last_text = ""
    #
    # for
    #
    #
    # text.each_char do |char, index|
    #   while char == symbol
    #
    #   end
    # end
  end


end
