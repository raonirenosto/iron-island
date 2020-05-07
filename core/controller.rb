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
        :level => text("command_level"),
        :life => text("command_life"),
        :get => text("command_get"),
        :places => text("command_places"),
        :go => text("command_go"),
        :help => text("command_help"),
        :exit => text("command_exit"),
        :all_commands => text("all_commands")
      }
      @@places = text("avaliable_places")
      @@places_h = {
        :iron_village => text("command_iron_village"),
        :iron_castle => text("command_iron_castle"),
        :iron_forest => text("command_iron_forest")
      }
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

  def is_avaliable_command? command, avaliable_commands
    avaliable_commands.each do |avaliable_command|
      if command.include_a? @@commands[avaliable_command]
        return true
      end
    end
    false
  end

  def is_not_avaliable_command? command, avaliable_commands
    !is_avaliable_command? command, avaliable_commands
  end

  def is_native_command? command
    is_avaliable_command? command, @@commands.keys
  end

  def is_not_native_command? command
    !is_native_command? command
  end

  def can_go_to command, avaliable_places
    right_place = command.include_a? avaliable_places
    is_go = is command, :go
    return (is_go and right_place)
  end

  def can_go_to_h command, avaliable_places
    right_place = false
    is_go = is command, :go

    avaliable_places.each do |avaliable_place|
      if command.include_a? @@places_h[avaliable_place]
        right_place = true
      end
    end

    return (is_go and right_place)
  end

  def can_not_go_to command, avaliable_places
    !can_go_to command, avaliable_places
  end

  def can_not_go_to_h command, avaliable_places
    !can_go_to_h command, avaliable_places
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

  def get_command command
    @@commands.each do |command_native, value|
      if command.include_a? value
        return command_native
      end
    end
    nil
  end

  def execute typed
    command = get_command typed

    case command
    when :level
      player.show_level
    when :life
      player.show_hp
    when :help
      show_help
    when :exit
      puts "Até mais forasteiro"
      exit(true)
    end
  end

  def show_help
    command_description.each do |command, description|
      puts command + " = " + description.yellow
    end
    puts
  end
end
