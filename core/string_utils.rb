module StringUtils

  def change_symbol_color orginal_text, text_color, symbol_color
    splited_text = orginal_text.split('*')
    before_symbol = splited_text[0].send(text_color)
    symbol =  splited_text[1].send(symbol_color)
    after_symbol = splited_text[2].send(text_color)
    return before_symbol + symbol + after_symbol
  end
end
