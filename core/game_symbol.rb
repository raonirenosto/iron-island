require "./core/string"

class GameSymbol

  attr_accessor :action_symbols, :place_symbols


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
end
