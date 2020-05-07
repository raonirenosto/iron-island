require_relative '../game.rb'

class Tutorial
  include Game

  def ask_for_tutorial
    introduce_gammel
  end

  def introduce_gammel
    clear
    puts text("tutorial_gammel_says")
    print_long_text text("tutorial_gammel_txt_1").green
    puts
    puts text("tutorial_gammel_says")
    print_long_text text("tutorial_gammel_txt_2").green
    puts
    puts text("tutorial_gammel_says")
    puts text("tutorial_gammel_tips").green

    splitted_text = text("tutorial_start_tutorial_question").split(/#{Regexp.escape("*")}(.*?)#{Regexp.escape("*")}/m)
    puts splitted_text[0].green +
      splitted_text[1].blue + splitted_text[2].green +
        splitted_text[3].blue + splitted_text[4].green

    puts

    yes_no_question(method(:show_tutorial), method(:skip_tutorial)) {
        puts
        puts text("tutorial_gammel_says")
        puts text("tutorial_gammel_unknown_answer").green
        splitted_text = text("tutorial_start_tutorial_question").split(/#{Regexp.escape("*")}(.*?)#{Regexp.escape("*")}/m)
        puts splitted_text[0].green +
          splitted_text[1].blue + splitted_text[2].green +
            splitted_text[3].blue + splitted_text[4].green
        puts
    }
  end

  def skip_tutorial
    puts
    puts text("tutorial_gammel_says")
    print_long_text text("tutorial_gammel_no_tutorial").green
    puts
    wait_until_type
  end

  def show_tutorial
    clear
    tutorial_level
  end

  def tutorial_level
    level_command = text("command_level")

    puts text("tutorial_gammel_says")
    puts text("tutorial_level").green
    puts

    begin
      puts text("tutorial_gammel_says")
      type_level = change_symbol_color text("tutorial_level_type"),
        :green, :blue
      puts type_level
      puts

      command = gets.chomp.downcase

      if not level_command.include? command
        puts
        puts text("tutorial_gammel_says")
        level_typo = change_symbol_color text("tutorial_level_typo"),
          :green, :blue
        puts level_typo
      end

      puts
    end while not level_command.include? command

    # Show player level
    puts text_with_var("tutorial_level_your_level", player.level).yellow
    puts

    wait_until_type

    tutorial_life
  end

  def tutorial_life
    life_command = text("command_life")

    clear
    puts text("tutorial_gammel_says")
    puts text("tutorial_life").green
    puts

    begin
      puts text("tutorial_gammel_says")
      type_life = change_symbol_color text("tutorial_life_type"),
        :green, :blue
      puts type_life
      puts

      command = gets.chomp.downcase

      if not life_command.include? command
        puts
        puts text("tutorial_gammel_says")
        life_typo = change_symbol_color text("tutorial_life_typo"),
          :green, :blue
        puts life_typo
      end

      puts
    end while not life_command.include? command

    puts text_with_var("tutorial_life_your_life", player.hp).yellow
    puts

    wait_until_type

    tutorial_places
  end

  def tutorial_places
    places_command = text("command_places")
    fake_places = text "tutorial_fake_places"

    clear
    puts text("tutorial_gammel_says")
    puts text("tutorial_places_well_done").green
    puts

    puts text("tutorial_gammel_says")
    puts text("tutorial_places_how_to_go").green
    puts

    begin
      puts text("tutorial_gammel_says")
      type_places = change_symbol_color text("tutorial_places_type"),
        :green, :blue
      puts type_places
      puts

      command = gets.chomp.downcase

      if not places_command.include? command
        puts
        puts text("tutorial_gammel_says")
        places_typo = change_symbol_color text("tutorial_places_typo"),
          :green, :blue
        puts places_typo
      end

      puts
    end while not places_command.include? command

    # mostrar lugares
    # FAKE
    puts  text("tutorial_places_avaliable").yellow
    fake_places.each do |place|
      puts place
    end
    puts

    wait_until_type

    tutorial_go
  end

  def tutorial_go

    go_command = text "command_go"
    fake_places = text "tutorial_fake_places"

    clear

    begin
      puts text("tutorial_gammel_says")
      type_go = change_symbol_color text("tutorial_go_type"),
        :green, :blue
      puts type_go
      puts text("tutorial_go_example").cyan
      puts

      puts text "tutorial_gammel_says"
      print_long_text text("tutorial_go_avaliable").green +
        " #{fake_places[0]}, #{fake_places[1]} #{text("common_and")} #{fake_places[2]}".blue
      puts

      command = gets.chomp.downcase

      puts

      if is_not command, :go
        puts text("tutorial_gammel_says")
        go_typo = change_symbol_color text("tutorial_go_typo"),
          :green, :blue
        puts go_typo
      end

      if is(command,:go) && can_not_go_to(command, fake_places)
        puts text("tutorial_gammel_says")
        puts text("tutorial_go_place_unavaliable").green
      end

      puts
    end while is_not(command,:go) || can_not_go_to(command, fake_places)

    # show where is going to
    place = what_is_the_place(command)
    puts "#{text("common_going_to").yellow} #{place.blue}"
    puts
    puts text("common_info")
    puts "#{text("common_you_get_to").yellow} #{place.blue}"
    puts

    wait_until_type

    tutorial_get
  end

  def tutorial_get
    get_commands = text "command_get"
    fake_items = text "tutorial_fake_items"

    clear
    puts text("tutorial_gammel_says")
    puts text("tutorial_get_well_done").green
    puts

    puts text("tutorial_gammel_says")
    puts text("tutorial_get_how_to").green
    puts

    begin
      puts text "tutorial_gammel_says"
      type_get = change_symbol_color text("tutorial_get_type"), :green, :blue
      puts type_get
      puts

      command = gets.chomp.downcase

      if not get_commands.include? command
        puts text("tutorial_gammel_says")
        get_typo = change_symbol_color text("tutorial_get_typo"),
          :green, :blue
        puts get_typo
      end

      puts
    end while not get_commands.include? command

    # mostrar itens para pegar
    # FAKE
    puts text("tutorial_get_itens").yellow
    fake_items.each do |item|
      puts item
    end
    puts

    wait_until_type

    tutorial_get_item
  end

  def tutorial_get_item
    get_commands = text "command_get"
    fake_items = text "tutorial_fake_items"

    clear

    begin
      puts text("tutorial_gammel_says")
      get_type = change_symbol_color text("tutorial_item_type"),
        :green, :blue
      puts get_type
      puts

      puts text "tutorial_gammel_says"
      print_long_text text("tutorial_item_avaliable").green +
        " #{fake_items[0]}, #{fake_items[1]} #{text("common_and")} #{fake_items[2]}".blue
      puts text("tutorial_item_example").cyan
      puts

      command = gets.chomp.downcase

      if is_not command, :get
        puts
        puts text("tutorial_gammel_says")
        item_typo = change_symbol_color text("tutorial_item_typo"),
          :green, :blue
        puts item_typo
      end

      if is(command, :get) && can_not_get_item?(command, fake_items)
        puts
        puts text("tutorial_gammel_says")
        puts text("tutorial_item_unavaliable").green
      end

      puts
    end while can_not_get_item?(command, fake_items)

    # Show the item
    puts "Você pegou o item ".yellow + what_item_is(command).blue
    puts

    wait_until_type

    tutorial_help
  end

  def tutorial_help
    help_commands = text "command_help"
    fake_help = text "tutorial_fake_help"

    clear

    puts text("tutorial_gammel_says")
    puts text("tutorial_help_running_out").green
    puts
    puts text("tutorial_gammel_says")
    puts text("tutorial_help_one_more_thing").green
    puts

    begin
      puts text("tutorial_gammel_says")
      help_type = change_symbol_color text("tutorial_help_type"),
        :green, :blue
      puts help_type
      puts

      command = gets.chomp.downcase

      puts
      if is_not command, :help
        puts text("tutorial_gammel_says")
        help_typo = change_symbol_color text("tutorial_help_typo"),
          :green, :blue
        puts help_typo
      end

      puts
    end while is_not command, :help

    puts text("tutorial_help_avaliable_commands").yellow
    puts
    command_description.each do |command, description|
      puts command + " = " + description.yellow
    end
    puts

    wait_until_type
    finish_tutorial
  end

  def finish_tutorial
    clear
    puts text("tutorial_gammel_says")
    puts text("tutorial_finish_congrats").green
    puts
    puts text("tutorial_gammel_says")
    puts text("tutorial_finish_see_you").green
    puts
    wait_until_type
  end
end
