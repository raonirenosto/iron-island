require './places/iron_island.rb'
require './places/iron_village/iron_village.rb'
require './places/iron_castle.rb'
require './places/iron_forest.rb'
require './places/iron_village/sorceress.rb'
require 'singleton'

class Factory
  include Singleton

  @@iron_island = nil
  @@iron_village = nil
  @@iron_castle = nil
  @@iron_forest = nil
  @@sorceress = nil

  def iron_island
    init @@iron_island, IronIsland
  end

  def iron_village
    if @@iron_village == nil
      @@iron_village = IronVillage.new
    end
    return @@iron_village
  end

  def iron_forest
    if @@iron_forest == nil
      @@iron_forest = IronForest.new
    end
    return @@iron_forest
  end

  def iron_castle
    if @@iron_castle == nil
      @@iron_castle = IronCastle.new
    end
    return @@iron_castle
  end

  def sorceress
    if @@sorceress == nil
      @@sorceress = Sorceress.new
    end
    return @@sorceress
  end

  def init variable, classz
    if variable == nil
      variable = classz.new
    end
    return variable
  end
end
