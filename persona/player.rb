class Player

  @@hp
  @@level
  @@coins
  @@place
  @@started_quests
  @@finished_quests
  @@bag

  def initialize
    @@hp = 1000
    @@level = 1
    @@coins = 0
    @@place = nil
    @@started_quests = []
    @@finished_quests = []
    @@bag = []
  end

  def level
    @@level
  end

  def hp
    @@hp
  end

  def coins
    @@coins
  end

  def go place
    @@place = place
    @@place.go
  end

  def where_am_i
    return @@place
  end

  def set_place place
    @@place = place
  end

  def start_quest quest
    quest.start
    @@started_quests << quest
  end

  def finish_quest quest
    quest.finish
    @@started_quests.delete_if { |started_quest| quest.name == started_quest.name }
    @@finished_quests << quest
  end

  def accepted_quest? quest
    started_quests = @@started_quests.select {|item| item.name == quest.name}
    finished_quests = @@finished_quests.select {|item| item.name == quest.name}
    started_quests.size > 0 || finished_quests.size > 0
  end

  def new_quest? quest
    not accepted_quest? quest
  end

  def quests
    @@started_quests
  end

  def add_to_bag item
    @@bag << item
  end

  def remove_from_bag item
    @@bag.delete_if { |bag_item| bag_item.name == item.name }
  end

  def in_the_bag? item
    result = @@bag.select { |item| item.name == item.name}
    result.size > 0
  end

  def add_coins number_of_coins
    @@coins += number_of_coins
  end
end
