require './places/iron_island.rb'
require './places/iron_village/iron_village.rb'
require './places/iron_castle.rb'
require './places/iron_forest/iron_forest.rb'
require './places/iron_forest/dark_swamp.rb'
require './places/iron_village/sorceress.rb'
require './game/items/magic_herbs.rb'
require './game/quests/sorceress/herb_quest.rb'
require 'singleton'

class Factory
  include Singleton

  @@iron_island = nil
  @@iron_village = nil
  @@iron_castle = nil
  @@iron_forest = nil
  @@sorceress = nil
  @@herb_quest = nil
  @@dark_swamp = nil
  @@magic_herbs = nil

  def iron_island
    init @@iron_island, IronIsland
  end

  def iron_village
    init @@iron_village, IronVillage
  end

  def iron_forest
    init @@iron_forest, IronForest
  end

  def dark_swamp
    init @@dark_swamp, DarkSwamp
  end

  def iron_castle
    init @@iron_castle, IronCastle
  end

  def sorceress
    init @@sorceress, Sorceress
  end

  def herb_quest
    init @@herb_quest, HerbQuest
  end

  def magic_herbs
    init @@magic_herbs, MagicHerbs
  end

  def init variable, classz
    if variable == nil
      variable = classz.new
    end
    return variable
  end
end
