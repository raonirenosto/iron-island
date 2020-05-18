class Player

  @@hp
  @@level
  @@coins
  @@place
  @@started_quests
  @@finished_quests

  def initialize
    @@hp = 1000
    @@level = 1
    @@coins = 0
    @@place = nil
    @@started_quests = []
    @@finished_quests = []
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
    @@started_quests << quest
  end

  def finish_quest quest

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
end
