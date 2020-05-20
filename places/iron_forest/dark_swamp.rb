require "./core/game.rb"
require "./places/place.rb"
require "./core/factory.rb"

class DarkSwamp < Place

  include Game

  def go
    clear
    show
  end

  def show
    out "dark_swamp_arrived", :information
    delay
    out "dark_swamp_arrived2", :information
  end

  def avaliable_commands
    super + [ :go, :level, :life, :places, :actions, :search, :get ]
  end

  def avaliable_places
    iron_forest = Factory.instance.iron_forest
    [ iron_forest ]
  end

  def avaliable_actions
    {
      :search_herbs => {
        :action => :search,
        :item => :magic_herbs
      }
    }
  end

  def avaliable_searchs
      magic_herbs = Factory.instance.magic_herbs
    [ magic_herbs ]
  end

  def search item_symbol
    case item_symbol
    when :magic_herbs
      search_magic_herbs
    end
  end

  def search_magic_herbs
    out "dark_swamp_search_magic_herbs", :information
    delay
    found_magic_herb
  end

  def found_magic_herb
    out "dark_swamp_found_magic_herbs", :information
    delay
    magic_herbs = Factory.instance.magic_herbs
    add_avaliable_item magic_herbs
  end

  def get item
    @@player.add_to_bag item
    out "dark_swamp_get_magic_herbs", :information
    delay
    out "dark_swamp_put_magic_herbs_bag", :information
  end

  def name
    text("dark_swamp_name")
  end

  def symbol
    :dark_swamp
  end
end
