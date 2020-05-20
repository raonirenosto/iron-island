require "./core/string"

class GameSymbol

  attr_accessor :action_symbols, :place_symbols, :menu_symbols, :quest_symbols,
    :item_symbols

  def extract_symbol text, hash_symbols
    symbols = []

    hash_symbols.each do |symbol, hash|
      if text.include_a? hash[:commands]
        symbols << symbol
      end
    end
    return symbols
  end

  def extract_action_symbol text
    symbol = self.extract_symbol(text, self.action_symbols)
    return symbol[0] if symbol != nil
  end

  def extract_place_symbol text
    symbol = self.extract_symbol(text, self.place_symbols)
    return symbol[0] if symbol != nil
  end

  def extract_menu_symbol text
    symbol = self.extract_symbol(text, self.menu_symbols)
    return symbol[0] if symbol != nil
  end

  def extract_quest_symbol text
    symbol = self.extract_symbol(text, self.quest_symbols)
    return symbol[0] if symbol != nil
  end

  def extract_item_symbol text
    symbol = self.extract_symbol(text, self.item_symbols)
    return symbol[0] if symbol != nil
  end

  def symbol_name symbol
    if self.action_symbols.include? symbol
      return self.action_symbols[symbol][:name]
    elsif self.place_symbols.include? symbol
      return self.place_symbols[symbol][:name]
    elsif self.menu_symbols.include? symbol
      return self.menu_symbols[symbol][:name]
    elsif self.quest_symbols.include? symbol
      return self.quest_symbols[symbol][:name]
    elsif self.item_symbols.include? symbol
      return self.item_symbols[symbol][:name]
    end
  end
end
