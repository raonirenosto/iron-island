require "./core/language.rb"
require './core/screen.rb'
require './core/tip.rb'
require './core/string_utils.rb'
require './core/string.rb'
require './core/flow.rb'
require './persona/player.rb'
require 'colorize'

module Game

  include Language
  include Screen
  include Tip
  include StringUtils
  include Flow
  # Controller should be included after tutorial refactor

  @@player

  def new_game
    @@player = Player.new
  end

  def player
    return @@player
  end
end
