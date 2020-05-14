class String

  def between string1, string2
    self[/#{Regexp.escape(string1)}(.*?)#{Regexp.escape(string2)}/m, 1]
  end

  def replace_between string1, string2, string_to_replace
    self.gsub(/#{Regexp.escape(string1)}(.*?)#{Regexp.escape(string2)}/m, string_to_replace)
  end

  def include_a? array
    array.each do |item|
      if self.downcase[/\b#{item.downcase}\b/]
        return true
      end
    end
    return false
  end

end
