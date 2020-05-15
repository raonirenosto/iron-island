module Screen
  def clear
    # clean console
    puts "\e[H\e[2J"
  end

    # Wraps the +text+ into lines no longer than +line_width+ width. This method
  # breaks on the first whitespace character that does not exceed +line_width+
  # (which is 80 by default).
  #
  #   word_wrap('Once upon a time')
  #   # => Once upon a time
  #
  #   word_wrap('Once upon a time, in a kingdom called Far Far Away, a king fell ill, and finding a successor to the throne turned out to be more trouble than anyone could have imagined...')
  #   # => Once upon a time, in a kingdom called Far Far Away, a king fell ill, and finding\na successor to the throne turned out to be more trouble than anyone could have\nimagined...
  #
  #   word_wrap('Once upon a time', line_width: 8)
  #   # => Once\nupon a\ntime
  #
  #   word_wrap('Once upon a time', line_width: 1)
  #   # => Once\nupon\na\ntime
  #
  #   You can also specify a custom +break_sequence+ ("\n" by default)
  #
  #   word_wrap('Once upon a time', line_width: 1, break_sequence: "\r\n")
  #   # => Once\r\nupon\r\na\r\ntime
  def word_wrap(text, line_width: 80, break_sequence: "\n")
    text.split("\n").collect! do |line|
      line.length > line_width ? line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1#{break_sequence}").rstrip : line
    end * break_sequence
  end

  def print_long_text text
    puts word_wrap(text, :line_width => 80)
  end

  def wait_until_type
    puts "Aperte enter para prosseguir".light_blue
    gets.chomp
  end
end
