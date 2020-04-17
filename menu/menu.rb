require 'yaml'
require 'colorize'

class Menu

  attr_accessor :place, :menu, :labels, :options, :origin

  protected :menu, :labels, :options

  @@MESSAGE = "Comando inválido, digite novamente uma opção válida:"

  def show_menu
    clear

    self.menu = get_menu place
    self.labels = get_labels

    self.options = show_root_menu(labels,menu)

    command = gets.chomp.downcase

    check command

    if options[command] == nil
      puts ""
      puts @@MESSAGE.green
      show_menu place
      return
    end

    send options[command]

    # puts ""
    # puts "(1) - Conversar"
    # puts "(2) - Comprar"
    # puts "(3) - Até mais"
    #
    # index = 1
    #
    # if @@text.count > 0
    #   puts "(#{index}) - Conversar"
    #   index += 1
    # end
    #
    # if @@action.count > 0
    #   puts "(#{index}) - Comprar"
    #   index += 1
    # end
    #
    # get_menu_option
  end

  def show_root_menu labels, menu

    show_welcome labels[menu["welcome"]]

    index = 0
    menu_map = {}

    if menu["talk"] != nil
      index += 1
      puts "( #{index} ) - #{labels["talk"]}"
      menu_map[index.to_s] = :show_talk_menu
      label = labels["talk"].downcase
      menu_map[label] = :show_talk_menu
    end

    if menu["action"] != nil
      index += 1
      action_label = menu["action"]["label"]
      puts "( #{index} ) - #{labels[action_label]}"
      menu_map[index.to_s] = :show_action_menu
      label = labels[action_label].downcase
      menu_map[label] = :show_action_menu
    end


    if menu["go_back"] != nil
      index += 1
      go_back_label = menu["go_back"]["label"]
      puts "( #{index} ) - #{labels[go_back_label]}"
      menu_map[index.to_s] = :go_back
      label = labels[go_back_label].downcase
      menu_map[label] = :go_back
    end

    puts ""
    menu_map
  end

  def go_back
    origin.go_back
  end

  def clear
    # clean console
    puts "\e[H\e[2J"
  end

  def check command
    if command == "sair"
      puts ""
      puts "Até logo forasteiro...".yellow
      puts ""
      puts "Pressione qualquer tecla para continuar...".green
      gets
      exit
    end
  end

  def show_action_menu
    clear
    index = 0
    hash = {}

    puts labels[menu["action"]["text"]].yellow
    puts ""
    menu["action"]["options"].each do |option|
      index += 1
      label = option["label"]
      puts "( #{index} ) - #{labels[label]}"
      if option["action"] == :go_back
        hash[index.to_s] = self.method(:show_menu)
        label = labels[label].downcase
        hash[label] = self.method(:show_menu)
        break
      end

      hash[index.to_s] = origin.method(option["action"])
      label = labels[label].downcase
      hash[label] = origin.method(option["action"])
    end

    command = gets.chomp.downcase

    check command

    if hash[command] == nil
      puts ""
      puts @@MESSAGE.green
      show_action_menu
      return
    end

    hash[command].call

  end

  def show_talk_menu

  end

  def say_goodbye *args
    args.each do |message|
      puts message.yellow
    end
    puts ""
    puts "Pressione qualquer tecla para continuar...".green
    gets
  end

  def show_welcome label
    puts label.yellow
    puts ""
  end

  def default_labels
    # retrieve from config
    language = "pt"
    label_hash = {}

    if language == "pt"
      label_hash = YAML::load_file(File.join(__dir__, '/languages/pt/menu_pt.yml'))
    end

    return label_hash
  end

  def get_labels
    read_yaml "/languages/#{language}/labels_#{language}.yml"
  end

  def get_place_label place
    read_yaml "/languages/#{language}/#{place}_#{language}.yml"
  end

  def get_menu place
    read_yaml "/places/#{place}.yml"
  end

  def language
    # retrieve config language ##todo
    language = "pt"
    return language
  end

  def read_yaml file
    YAML::load_file(File.join(__dir__, file))
  end
end
