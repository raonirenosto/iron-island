require "./core/game.rb"

class MagicHerbs
  include Game

  def name
    text("command_quest_herb_name")
  end

  def symbol
    :magic_herbs
  end
end
