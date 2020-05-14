require 'minitest/autorun'
require "./core/string.rb"
require "./core/controller.rb"

class ControllerTest < Minitest::Spec

  @@controller = nil

  def setup
    @@controller = Controller.new
  end

  def test_invalid_command
    typed = "nada"

    error = assert_raises RuntimeError do
      @@controller.execute typed
    end

    assert error.message == "error_invalid_command"
  end


  # def setup
  #   set_language "pt"
  #   new_game
  #   player.set_place IronIsland.instance
  # end

  # def test_is_command
  #   assert is_command? "pega", :get
  #   assert is_command? "pegar", :get
  #   assert is_command? "junta", :get
  #   assert is_command? "juntar", :get
  #   assert is_command? "vou pegar", :get
  #   assert is_command? "vou pega", :get
  #   assert is_command? "vou junta", :get
  #   assert is_command? "vou juntar", :get
  #
  #   assert is_command? "lugares", :places
  #   assert is_command? "lugar", :places
  # end
  #
  # def test_is_not_command
  #   assert is_not_command? "ir", :get
  # end

  # def test_validate_commands_invalid_command
  #
  #     typed = "nada"
  #
  #     error = assert_raises RuntimeError do
  #       validate_commands typed
  #     end
  #
  #     assert error.message == "error_invalid_command"
  # end
  #
  # def test_validate_commands_unavaliable_command
  #
  #     typed = "pegar tal coisa"
  #
  #     error = assert_raises RuntimeError do
  #       validate_commands typed
  #     end
  #
  #     assert error.message == "error_unavalibale_command"
  # end
  #
  # def test_validate_commands_unavaliable_command
  #
  #     typed = "pegar tal coisa"
  #
  #     error = assert_raises RuntimeError do
  #       validate_commands typed
  #     end
  #
  #     assert error.message == "error_unavalibale_command"
  # end
  #
  # def test_validate_commands_invalid_place
  #
  #     typed = "ir para wonderland"
  #
  #     error = assert_raises RuntimeError do
  #       validate_commands typed
  #     end
  #
  #     assert error.message == "error_invalid_place"
  # end
end
