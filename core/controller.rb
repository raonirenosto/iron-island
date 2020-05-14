require "./core/array.rb"

class Controller

  :attr_accessor :game_symbols

  def validate_commands typed
    symbols = get_all_symbols typed, all_avaliable_symbols

    if symbols.empty?
      raise "error_invalid_command"
    end

    current_place = player.where_am_i

    if not current_place.avaliable_commands.include_array? symbols
      raise "error_unavalibale_command"
    end

    if symbols.include? :go
      # check if place is not a valid one
      if not current_place.avaliable_places.include_array? symbols
        raise "error_invalid_place"
      end
    end
  end

  def get_command_symbol symbols
    get_symbol_from_hash all_command_symbols, symbols
  end

  def get_place_symbol symbols
    get_symbol_from_hash all_place_symbols, symbols
  end

  def get_symbol_from_hash hash, symbols
    hash.each do |symbol, command_sample|
      if symbols.include? symbol
        return symbol
      end
    end
    return nil
  end

  def extract_symbol
  end

  def execute typed



    validate_commands typed

    symbols = get_all_symbols typed, all_avaliable_symbols

    command_symbol = get_command_symbol symbols

    case command_symbol
    when :level
      show_level
    when :life
      show_hp
    when :help
      show_help
    when :places
      show_places
    when :go
      place_symbol = get_place_symbol symbols
      go_to place_symbol
    when :exit
      puts "Até mais forasteiro"
      exit(true)
    end
  end

  def load_command command, avaliable_places, avaliable_commands
    validate_commands typed

    symbols = get_all_symbols typed, all_avaliable_symbols

    command_symbol = get_command_symbol symbols

    case command_symbol
    when :level
      show_level
    when :life
      show_hp
    when :help
      show_help
    when :places
      show_places
    when :go
      place_symbol = get_place_symbol symbols
      go_to place_symbol
    when :exit
      puts "Até mais forasteiro"
      exit(true)
    end
  end

  # def show_help
  #   command_description.each do |command, description|
  #     puts command + " = " + description.yellow
  #   end
  #   puts
  # end
  #
  # def show_level
  #   puts "Você está no nivel ".yellow + player.level.to_s.blue
  #   puts
  # end
  #
  # def show_hp
  #   puts "Você tem ".yellow + player.hp.to_s.blue + " pontos de vida".yellow
  #   puts
  # end
  #
  # def show_places
  #   current_location = player.where_am_i
  #
  #   puts "Lugares disponíveis:".yellow
  #
  #   current_location.avaliable_places.each do |place|
  #     place_info = meta_data :places, place
  #     puts place_info[:name]
  #   end
  #   puts
  # end
  #
  # def show_help
  #   command_description = text "command_description"
  #   command_description.each do |command, description|
  #     puts command + " = " + description.yellow
  #   end
  #   puts
  # end
  #
  # def go_to place_symbol
  #   place_info = meta_data :places, place_symbol
  #   place = place_info[:instance]
  #   player.go place
  # end
end
