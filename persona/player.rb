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

  def show_level
    puts "Você está no nivel ".yellow + self.level.to_s.blue
    puts
  end

  def show_hp
    puts "Você tem ".yellow + self.hp.to_s.blue + " pontos de vida".yellow
    puts
  end
end
