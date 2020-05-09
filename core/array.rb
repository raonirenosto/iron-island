class Array

  def include_array? array
    self.any?{|x| array.include?(x)}
  end
end
