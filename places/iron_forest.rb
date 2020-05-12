require "./game"
require "singleton"

class IronForest
  include Game
  include Singleton

  def go
    clear
    show_sign
  end

  def show_sign
    puts text "iron_forest_sign_says"
    puts text("iron_village_welcome").green
    puts text("iron_village_sign2").green
    puts
  end

  def avaliable_commands
    return [ :go, :level, :life, :help, :exit, :places ]
  end

  def avaliable_places
    [ :iron_village, :iron_castle]
  end
end
