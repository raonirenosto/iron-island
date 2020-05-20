require "./core/game.rb"
require "./places/place.rb"
require "./core/factory.rb"

class IronForest < Place
  include Game

  def go
    clear
    show_sign
  end

  def show_sign
    puts text "iron_forest_sign_says"
    puts text("iron_forest_welcome").green
    puts text("iron_forest_sign2").green
    puts
  end

  def avaliable_commands
    super + [ :go, :level, :life, :places ]
  end

  def avaliable_places
    iron_village = Factory.instance.iron_village
    dark_swamp = Factory.instance.dark_swamp
    [ iron_village, dark_swamp ]
  end

  def name
    text("iron_forest_name")
  end

  def symbol
    :iron_forest
  end
end
