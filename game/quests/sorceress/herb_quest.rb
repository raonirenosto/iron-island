require "./game/quests/quest.rb"
require "./core/game.rb"

class HerbQuest < Quest
  include Game

  def name
    text('quest_herb_name')
  end

  def description
    text('quest_herb_description')
  end

  def symbol
    :quest_herb
  end
end
