require 'minitest/autorun'
require "./core/meta_data.rb"
require "./core/meta_data.rb"
require "./iron_village/iron_village.rb"

class MetaDataTest < Minitest::Spec
  include MetaData

  def setup
    set_language "pt"
  end

  def test_meta_data
    iron_village_meta_data = meta_data :places, :iron_village
    instance = iron_village_meta_data[:instance]
    commands = iron_village_meta_data[:commands]

    assert instance.instance_of? IronVillage
    assert commands == text("command_iron_village")
  end

  def test_all_avaliable_symbols
    avaliable_symbols = all_avaliable_symbols

    puts avaliable_symbols
  end
end
