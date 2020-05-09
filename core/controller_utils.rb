require "./core/string.rb"

module ControllerUtils

  # def can_get_symbol? typed, avaiable_symbols
  #   typed.include_a? avaiable_symbols
  # end

  def get_symbol typed, hash_symbols, exclude=nil
    hash_symbols.each do |symbol, type_sample|
      if typed.include_a? type_sample
        return symbol
      end
    end
    return nil
  end

  def get_all_symbols typed, hash_symbols
    symbols = []
    hash_symbols.each do |symbol, type_sample|
      if typed.include_a? type_sample
        symbols << symbol
      end
    end
    return symbols
  end

  # def is_avaliable? symbol, avaliable_symbols
  #   avaliable_symbols.include?
  # end
  #
  # def is_avaliable_command? typed, symbol, hash_symbols
  #   if not hash_symbols.include? symbol
  #     raise "Command '#{symbol}' does not exist."
  #   end
  #
  #   typed.include_a? hash_symbols[symbol]
  # end
  #
  # def is_not_avaliable_command? typed, symbol, hash_symbols
  #   !is_avaliable_command? typed, symbol, hash_symbols
  # end

  # def is? command, symbol
  #   if not @@commands.include? symbol
  #     puts "Command '#{symbol}' does not exist."
  #   end
  #
  #   command.include_a? @@commands[symbol]
  # end

  # def is_not? command, symbol
  #   !is? command, symbol
  # end
  #
  # def is_avaliable_command? command, avaliable_commands
  #   avaliable_commands.each do |avaliable_command|
  #     if command.include_a? @@commands[avaliable_command]
  #       return true
  #     end
  #   end
  #   false
  # end
  #
  # def is_not_avaliable_command? command, avaliable_commands
  #   !is_avaliable_command? command, avaliable_commands
  # end
  #
  # def is_native_command? command
  #   is_avaliable_command? command, @@commands.keys
  # end
  #
  # def is_not_native_command? command
  #   !is_native_command? command
  # end
  #
  # def can_go_to command, avaliable_places
  #   right_place = command.include_a? avaliable_places
  #   is_go = is command, :go
  #   return (is_go and right_place)
  # end
  #
  # def can_go_to_h command, avaliable_places
  #   right_place = false
  #   is_go = is command, :go
  #
  #   avaliable_places.each do |avaliable_place|
  #     if command.include_a? @@places_h[avaliable_place]
  #       right_place = true
  #     end
  #   end
  #
  #   return (is_go and right_place)
  # end
  #
  # def can_not_go_to command, avaliable_places
  #   !can_go_to command, avaliable_places
  # end
  #
  # def can_not_go_to_h command, avaliable_places
  #   !can_go_to_h command, avaliable_places
  # end
  #
  # def what_is_the_place command
  #   @@places.each do |place|
  #     if command.downcase.include? place.downcase
  #       return place
  #     end
  #   end
  #   return nil
  # end
  #
  # def what_is_the_place_h command
  #   @@places_h.each do |symbol, command_sample|
  #     if command.downcase.include_a? command_sample
  #       return symbol
  #     end
  #   end
  #   return nil
  # end
  #
  # def can_get_item? command, avaliable_items
  #   right_item = command.include_a? avaliable_items
  #   is_get = is command, :get
  #   return (is_get and right_item)
  # end
  #
  # def can_not_get_item? command, avaliable_items
  #   !can_get_item? command, avaliable_items
  # end
  #
  # def what_item_is command
  #   @@items.each do |item|
  #     if command.downcase.include? item.downcase
  #       return item
  #     end
  #   end
  #   return nil
  # end
  #
  # def command_description
  #   text("command_description").sort.to_h
  # end
  #
  # def get_command command
  #   @@commands.each do |command_native, value|
  #     if command.include_a? value
  #       return command_native
  #     end
  #   end
  #   nil
  # end

end
