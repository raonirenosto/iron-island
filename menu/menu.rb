require 'yaml'

module Menu

  @@MESSAGE = "Comando inválido, digite novamente uma opção válida:"

  def show_menu place

    menu = get_menu place
    labels = get_labels

    options = show_root_menu(labels,menu)

    pp options

    command = gets.chomp.downcase

    check command

    if options[command] == nil
      puts ""
      puts @@MESSAGE.green
      show_menu place
    end

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
    options = {}

    if menu["talk"] != nil
      index += 1
      puts "( #{index} ) - #{labels["talk"]}"
      options[index.to_s] = :show_talk_menu
      label = labels["talk"].downcase
      options[label] = :show_talk_menu
    end

    if menu["action"] != nil
      index += 1
      action_label = menu["action"]["label"]
      puts "( #{index} ) - #{labels[action_label]}"
      options[index.to_s] = :show_action_menu
      label = labels[action_label].downcase
      options[label] = :show_action_menu
    end

    options
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
