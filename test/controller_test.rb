require 'minitest/autorun'
require "./game.rb"
require "./core/string.rb"

class ControllerTest < Minitest::Spec
  include Game

  def setup
    set_language "pt"
    start_controller
  end

  def test_is_get
    assert is "pega", :get
    assert is "pegar", :get
    assert is "junta", :get
    assert is "juntar", :get
    assert is "vou pegar", :get
    assert is "vou pega", :get
    assert is "vou junta", :get
    assert is "vou juntar", :get
  end

  def test_is_places
    assert is "lugares", :places
    assert is "lugar", :places
  end

  def test_can_go_to
    avaliable_places = ["Castelo de Ferro", "Vila de Ferro"]
    command = "Ir para o Castelo de Ferro"
    assert can_go_to command.downcase, avaliable_places
  end

  def test_can_go_to_false
    avaliable_places = ["Castelo de Ferro", "Vila de Ferro"]
    command = "Ir para o Castelo de Barro"
    assert_equal false, can_go_to(command.downcase, avaliable_places)
  end

  def test_can_not_go_to
    avaliable_places = ["Castelo de Ferro", "Vila de Ferro"]
    command = "Ir para o Castelo de Barro"
    assert_equal true, can_not_go_to(command.downcase, avaliable_places)
  end

  def test_what_is_the_place
    command = "Ir para a Vila de ferro"
    assert_equal "Vila de Ferro", what_is_the_place(command)
  end

  def test_can_get_item_true
    avaliable_items = ["Espada", "Porrete"]
    command = "pegar porrete"
    assert_equal true, can_get_item?(command.downcase, avaliable_items)
  end

  def test_can_get_item_false
    avaliable_items = ["Espada", "Porrete"]
    command = "pegar faca"
    assert_equal false, can_get_item?(command.downcase, avaliable_items)
  end

  def test_can_not_get_item
    avaliable_items = ["Espada", "Porrete"]
    command = "pegar faca"
    assert_equal true, can_not_get_item?(command.downcase, avaliable_items)
  end
end
