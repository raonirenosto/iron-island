require "./core/language.rb"

module Controller

  include Language

  @@commands = nil
  @@typed_command = nil
  @@places = nil
  @@items = nil

  def start_controller
    if language_was_set?
      @@commands = {
        :get => text("command_get"),
        :places => text("command_places"),
        :go => text("command_go"),
        :help => text("command_help"),
        :all_commands => text("all_commands")
      }
      @@places = text("avaliable_places")
      @@items = text("avaliable_items")
    end
  end

  def is command, symbol
    if not @@commands.include? symbol
      puts "Command '#{symbol}' does not exist."
    end

    command.include_a? @@commands[symbol]
  end

  def is_not command, symbol
    !is command, symbol
  end

  def can_go_to command, avaliable_places
    right_place = command.include_a? avaliable_places
    is_go = is command, :go
    return (is_go and right_place)
  end

  def can_not_go_to command, avaliable_places
    !can_go_to command, avaliable_places
  end

  def what_is_the_place command
    @@places.each do |place|
      if command.downcase.include? place.downcase
        return place
      end
    end
    return nil
  end

  def can_get_item? command, avaliable_items
    right_item = command.include_a? avaliable_items
    is_get = is command, :get
    return (is_get and right_item)
  end

  def can_not_get_item? command, avaliable_items
    !can_get_item? command, avaliable_items
  end

  def what_item_is command
    @@items.each do |item|
      if command.downcase.include? item.downcase
        return item
      end
    end
    return nil
  end

  def command_description
    text("command_description").sort.to_h
  end
end
