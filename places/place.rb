class Place

  def avaliable_places
    return []
  end

  def avaliable_place_by_symbol symbol
    avaliable_places.each do |place|
      if place.symbol == symbol
        return place
      end
    end
    return nil
  end

  def avaliable_commands
    [ :help, :exit, :quests ]
  end
end
