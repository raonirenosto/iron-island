require "./places/iron_village/iron_village.rb"
require "./places/iron_forest.rb"
require "./places/iron_castle.rb"
require "./core/language.rb"

module MetaData
  include Language

  @@meta_data_info = nil

  def init
    if @@meta_data_info == nil
      @@meta_data_info =
        {
          :places => {
            :iron_village => {
              :commands => text("command_iron_village"),
              :instance => IronVillage.instance,
              :name => text("place_iron_village")
            },
            :iron_forest => {
              :commands => text("command_iron_forest"),
              :instance => IronForest.instance,
              :name => text("place_iron_forest")
            },
            :iron_castle => {
              :commands => text("command_iron_castle"),
              :instance => IronCastle.instance,
              :name => text("place_iron_castle")
            }
          },
          :commands => {
            :level => text("command_level"),
            :life => text("command_life"),
            :get => text("command_get"),
            :places => text("command_places"),
            :go => text("command_go"),
            :help => text("command_help"),
            :exit => text("command_exit")
          }
        }
    end
  end

  def meta_data category, symbol
    init
    if not @@meta_data_info.include? category
      puts "Meta data category :#{category} was not found"
      return
    end
    if not @@meta_data_info[category].include? symbol
      puts "Meta data symbol :#{symbol} was not found"
      return
    end
    return @@meta_data_info[category][symbol]
  end

  def meta_data_root
    init
    return @@meta_data_info
  end

  def all_avaliable_symbols
    init
    symbols = {}
    # @@meta_data_info[:places].each do |symbol, command_sample|
    #   symbols.merge()
    # end
    # @@meta_data_info[:commands].each do |symbol, command_sample|
    #   symbols << symbol
    # end
    @@meta_data_info[:places].each do |symbol, command_sample|
      symbols[symbol] = command_sample[:commands]
    end

    @@meta_data_info[:commands].each do |symbol, command_sample|
      symbols[symbol] = command_sample
    end

    return symbols
  end

  def all_command_symbols
    init
    symbols = {}

    @@meta_data_info[:commands].each do |symbol, command_sample|
      symbols[symbol] = command_sample
    end

    return symbols
  end

  def all_place_symbols
    init
    symbols = {}

    @@meta_data_info[:places].each do |symbol, command_sample|
      symbols[symbol] = command_sample
    end

    return symbols
  end
end
