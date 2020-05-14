require "singleton"

class IronCastle
  include Singleton

  def go
    clear
    puts "O soldado do castelo diz:"
    puts "Somente cavaleiros de ferro são permitidos no castelo".green
    puts
  end

  def avaliable_commands
    return [ :go, :level, :life, :help, :exit, :places ]
  end

  def avaliable_places
    [ :iron_village, :iron_forest]
  end

  def name
    return text("iron_castle_name")
  end
end
