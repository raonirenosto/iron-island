require_relative "core/language.rb"
require_relative 'core/screen.rb'
require_relative 'core/controller.rb'
require_relative 'core/tip.rb'
require_relative 'core/string_utils.rb'
require_relative 'persona/player.rb'
require_relative 'core/string.rb'
require 'colorize'

module Game

  include Language
  include Screen
  include Controller
  include Tip
  include StringUtils

  @@player

  def new_game
    @@player = Player.new
  end

  def player
    return @@player
  end
end
