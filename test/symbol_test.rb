require 'minitest/autorun'
require "./core/game_symbol.rb"

class SymbolTest < Minitest::Spec

  def setup
    symbol_hash =
      {
        :get => {
          :commands => ["pegar", "pega"]
        },
        :go => {
          :commands => ["ir", "quero ir"]
        }
      }

    @symbol = GameSymbol.new
    @symbol.action_symbols = symbol_hash
  end

  def test_exctract_symbol

    assert_equal :go, @symbol.extract_action_symbol("ir para tal lugar")
    assert_nil @symbol.extract_action_symbol("nada nada")
    assert_equal :get, @symbol.extract_action_symbol("pegar tal coisa")
  end
end
