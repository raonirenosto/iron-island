class Player
  @@hp
  @@level
  @@coins
  @@place

  def initialize
    @@hp = 1000
    @@level = 1
    @@coins = 0
    @@place = nil
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
end
