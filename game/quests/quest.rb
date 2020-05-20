class Quest

  @@status = :avaliable

  def start
    @@status = :started
  end

  def finish
    @@status = :finished
  end

  def started?
    @@status == :started
  end

  def finished?
    @@status == :finished
  end
end
