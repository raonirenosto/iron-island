require 'minitest/autorun'
require "./game.rb"
require "./core/string.rb"
require "./core/controller_old.rb"

class ControllerOldTest < Minitest::Spec
  include ControllerOld

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

  def test_is_not_partial_string
    assert_equal false, is("vou sair", :go) # bug ir and sair
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

  def test_is_avaliable_command_true
    avaliable_commands = [ :get, :level]
    command = "quero saber meu nivel"
    assert_equal true, is_avaliable_command?(command, avaliable_commands)
  end

  def test_is_avaliable_command_false
    avaliable_commands = [ :get, :places]
    command = "quero saber meu nivel"
    assert_equal false, is_avaliable_command?(command, avaliable_commands)
  end

  def test_is_native_command_true
    command = "quero saber meu nivel"
    assert_equal true, is_native_command?(command)
  end

  def test_is_native_command_false
    command = "quero saber uma cor"
    assert_equal false, is_native_command?(command)
  end

  def test_can_go_to_h_true
    avaliable_places = [:iron_castle, :iron_forest]
    command = "quero ir para a floresta"
    assert can_go_to_h command.downcase, avaliable_places
  end

  def test_can_go_to_h_false
    avaliable_places = [:iron_castle, :iron_village]
    command = "quero ir para a floresta"
    assert_equal false, can_go_to_h(command.downcase, avaliable_places)
  end

  def test_get_command
    command = "quero ir para a floresta"
    assert_equal :go, get_command(command.downcase)

    command = "quero pegar uma espada"
    assert_equal :get, get_command(command.downcase)
  end

  def test_what_is_the_place_h
    command = "ir para a vila de ferro"
    assert_equal :iron_village, what_is_the_place_h(command.downcase)

    command = "ir para a qualquer lugar"
    assert_nil what_is_the_place_h(command.downcase)
  end
end
