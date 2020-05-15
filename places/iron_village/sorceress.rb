require "./core/game.rb"
require "./core/factory.rb"
require "./places/place.rb"
require "./game/menu/sorceress_menu.rb"

class Sorceress < Place
  include Game

  def go
    clear
    travel
    greetings
    show_menu
    exit
  end

  def travel
    out "sorceress_get_to_tent", :information
    delay
    out "sorceress_enter_tent", :information
    delay
  end

  def greetings
    out "sorceress_asks", :speak_say
    out "sorceress_asks_text", :speak_text
  end

  def show_menu
    sorceress_menu = SorceressMenu.new
    sorceress_menu.show_menu
  end

  def exit
    out "sorceress_says", :speak_say
    out "sorceress_see_you", :speak_text
    delay
    out "sorceress_says", :speak_say
    out "sorceress_bye", :speak_text
    wait_until_type
    iron_village_entrance = Factory.instance.iron_village
    go_to iron_village_entrance
  end

  def avaliable_places
    iron_village = Factory.instance.iron_village
    [ iron_village ]
  end

  def avaliable_commands
    super + [:places, :go]
  end

  def name
    text("sorceress_name")
  end

  def symbol
    :sorceress
  end
end
