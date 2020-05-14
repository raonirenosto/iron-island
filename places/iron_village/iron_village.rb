require "./core/game.rb"
require "./core/factory.rb"
require "./places/place.rb"
# require_relative "../place"
# require_relative "blacksmith"
# require_relative "sorceress"
# require_relative "iron_market"
# require_relative "iron_house"
# require_relative "iron_church"
# require_relative "iron_knight_order"
# require_relative "iron_horse_stable"

class IronVillage < Place
  include Game

  def go
    clear
    show_sign
  end

  def show_sign
    out "iron_village_sign_says", :speak_say
    out  "iron_village_welcome", :speak_text

    out "iron_village_sign2_says", :speak_say
    out  "iron_village_sign2", :speak_text
  end

  def avaliable_commands
    super + [ :go, :level, :life, :places ]
  end

  def avaliable_places
    iron_forest = Factory.instance.iron_forest
    iron_castle = Factory.instance.iron_castle
    [ iron_forest, iron_castle]
  end

  def name
    text("iron_village_name")
  end

  def symbol
    :iron_village
  end
end
