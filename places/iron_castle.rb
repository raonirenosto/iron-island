require "./core/game.rb"
require "./places/place.rb"
require "./core/factory.rb"

class IronCastle < Place
  include Game

  def go
    clear
    puts "O soldado do castelo diz:".green
    puts "Somente cavaleiros de ferro são permitidos no castelo".light_white
    puts
  end

  def avaliable_commands
    super + [ :go, :level, :life, :places ]
  end

  def avaliable_places
    iron_forest = Factory.instance.iron_forest
    iron_village = Factory.instance.iron_village
    [ iron_forest, iron_village]
  end

  def name
    return text("iron_castle_name")
  end

  def symbol
    :iron_castle
  end
end
