require 'yaml'

module Menu

  @@texts = []
  @@actions = []

  def add_talk_menu menu
    @@texts = menu
  end

  def add_action_menu menu
    @@actions = menu
  end

  def show_meinu

    thing = YAML::load_file(File.join(__dir__, '../menu/blacksmith.yml'))

    pp thing["action"]["options"][0]["label"]
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

  def show_talk_menu
    index = 0
    @@texts.each do |text|
      index += 1
      puts "(#{index}) - #{text[:label]}"
    end
  end

  def show_talk_menu
    show_items @@texts
  end

  def show_action_menu
    show_items @@actions
  end

  def show_items options
    index = 0
    options.each do |option|
      index += 1
      puts "(#{index}) - #{option[:label]}"
    end
  end
end
