class Place

  @@items = []

  def avaliable_places
    return []
  end

  def avaliable_place_by_symbol symbol
    # avaliable_places.each do |place|
    #   if place.symbol == symbol
    #     return place
    #   end
    # end
    # return nil
    get_object_by_symbol symbol, avaliable_places
  end

  def avaliable_item_by_symbol symbol
    # avaliable_places.each do |place|
    #   if place.symbol == symbol
    #     return place
    #   end
    # end
    # return nil
    get_object_by_symbol symbol, avaliable_items
  end

  def get_object_by_symbol symbol, list
    list.each do |item|
      if item.symbol == symbol
        return item
      end
    end
    return nil
  end

  def avaliable_commands
    [ :help, :exit, :quests, :coins ]
  end

  def add_avaliable_item item
    @@items << item
  end

  def avaliable_items
    @@items
  end
end
