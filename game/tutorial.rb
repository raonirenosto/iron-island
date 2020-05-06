require_relative '../game.rb'

class Tutorial
  include Game

  def ask_for_tutorial
    introduce_gammel
  end

  def introduce_gammel
    clear
    puts text("iron_island_gammel_says")
    print_long_text text("iron_island_gammel_txt_1").green
    puts
    puts text("iron_island_gammel_says")
    print_long_text text("iron_island_gammel_txt_2").green
    puts
    puts text("iron_island_gammel_says")
    puts text("iron_island_gammel_tips").green
    print_long_text text("iron_island_start_tutorial_question").green
    puts

    yes_no_question(method(:show_tutorial), method(:skip_tutorial)) {
        puts text("iron_island_gammel_says")
        puts text("iron_island_gammel_unknown_answer").yellow
        print_long_text text("iron_island_start_tutorial_question").green
        puts
    }
  end

  def skip_tutorial
    puts
    puts text("iron_island_gammel_says")
    print_long_text text("iron_island_gammel_no_tutorial").green
    puts
    wait_until_type
  end

  def show_tutorial
    clear

    tutorial_level
  end

  def tutorial_level
    level_command = text("command_level")

    puts text("iron_island_gammel_says")
    puts text("tutorial_level").green
    puts

    begin
      puts text("iron_island_gammel_says")
      type_level = change_symbol_color text("tutorial_level_type"),
        :green, :blue
      puts type_level
      puts

      command = gets.chomp.downcase

      if not level_command.include? command
        puts
        puts text("iron_island_gammel_says")
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
    puts text("iron_island_gammel_says")
    puts text("tutorial_life").green
    puts

    begin
      puts text("iron_island_gammel_says")
      type_life = change_symbol_color text("tutorial_life_type"),
        :green, :blue
      puts type_life
      puts

      command = gets.chomp.downcase

      if not life_command.include? command
        puts
        puts text("iron_island_gammel_says")
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
    puts text("iron_island_gammel_says")
    puts text("tutorial_places_well_done").green
    puts

    puts text("iron_island_gammel_says")
    puts text("tutorial_places_how_to_go").green
    puts

    begin
      puts text("iron_island_gammel_says")
      type_places = change_symbol_color text("tutorial_places_type"),
        :green, :blue
      puts type_places
      puts

      command = gets.chomp.downcase

      if not places_command.include? command
        puts
        puts text("iron_island_gammel_says")
        places_typo = change_symbol_color text("tutorial_places_typo"),
          :green, :blue
        puts places_typo
      end

      puts
    end while not places_command.include? command

    # mostrar lugares
    # FAKE
    puts "Lugares disponíveis:".yellow
    fake_places.each do |place|
      puts place
    end
    puts

    wait_until_type

    clear
    tutorial_go
  end

  def tutorial_go

    go_command = text "command_go"
    fake_places = text "tutorial_fake_places"
    village_chosen = ""

    begin
      puts text "iron_island_gammel_says"
      print_long_text "Ok, agora digite ".green + "ir + o nome do lugar ".blue +
       " ou simplesmente " + "o nome do lugar".blue
      puts

      command = gets.chomp.downcase

      right_command = going_right? fake_places, command

      if not right_command
        puts text("iron_island_gammel_says")
        puts "Você não digitou ".green + "ir + o nome do lugar ".blue +
          " ou " + "o nome do lugar".blue + " forasteiro".green
      else
        village_chosen = command.split.last
      end

      puts
    end while not right_command

    # mostrar lugares
    # FAKE
    puts "Você foi para o Castelo de Ferro".yellow
    puts

    wait_until_type

    clear
    puts text("iron_island_gammel_says")
    puts "Muito bom forasteiro".green
    puts

    puts text("iron_island_gammel_says")
    puts "Agora vamos ver como pegar um item".green
    puts

    tutorial_get
  end

  def tutorial_get
    get_commands = text "command_get"
    fake_items = text "tutorial_fake_items"

    begin
      puts text "iron_island_gammel_says"
      print_long_text "Digite ".green + "pegar".blue +
       " para ver quais itens é possível pegar".green
      puts

      command = gets.chomp.downcase

      if not get_commands.include? command
        puts text("iron_island_gammel_says")
        puts "Você não digitou ".green + "pegar".blue + " forasteiro".green
      end

      puts
    end while not get_commands.include? command

    # mostrar itens para pegar
    # FAKE
    puts "Itens que estão no chão:".yellow
    fake_items.each do |item|
      puts item
    end
    puts

    wait_until_type

    clear
    puts text("iron_island_gammel_says")
    puts "Certo! Agora digite ".green + "pegar".blue + " o item que quer pegar"
    puts

    tutorial_get_item
  end

  def tutorial_get_item
    get_commands = text "command_get"
    fake_items = text "tutorial_fake_items"

    begin
      puts text "iron_island_gammel_says"
      print_long_text "Digite ".green + "pegar".blue +
       " e o item que quer pegar".green
      puts

      command = gets.chomp.downcase

      right_command = get_right_item? fake_items, command

      if not right_command
        puts text("iron_island_gammel_says")
        puts "Você não digitou ".green + "pegar (item que quer pegar)".blue + " forasteiro".green
      end

      puts
    end while not right_command

    # Pegar Item
    # FAKE
    puts "Você pegou a espada".yellow
    puts

    wait_until_type

    clear

    puts text("iron_island_gammel_says")
    puts "Já estou quase sem dicas para dar para você".green
    puts
    puts text("iron_island_gammel_says")
    puts "Mas existe mais uma coisinha que você deve lembrar, forasteiro".green
    puts
  end

  def tutorial_help
    help_commands = text "command_help"
    fake_help = text "tutorial_fake_help"

    begin
      puts text("iron_island_gammel_says")
      puts "Se você estiver com dúvidas, digite ".green + "ajuda".blue +
        " para receber uma lista de comandos disponíveis"
      puts

      command = gets.chomp.downcase

      right_command = get_right_item? fake_items, command

      if not right_command
        puts text("iron_island_gammel_says")
        puts "Você não digitou ".green + "pegar (item que quer pegar)".blue + " forasteiro".green
      end

      puts
    end while not right_command

    puts "Comandos disponíveis".yellow
    fake_help.each do |item|
      puts item
    end
    puts

    wait_until_type

    clear
    puts text("iron_island_gammel_says")
    puts "Excelente, agora você está por sua conta"
    puts
    puts text("iron_island_gammel_says")
    puts "Até mais forasteiro"
    puts
    wait_until_type
  end

  def going_right? places, command
    go_commands = text "command_go"

    go_commands.each do |go_command|
      places.each do |place|
        to_test = go_command.downcase + " " + place.downcase
        if command == to_test
          return true
        end
      end
    end
    return false
  end

  def get_right_item? items, command
    get_commands = text "command_get"

    get_commands.each do |get_command|
      items.each do |item|
        to_test = get_command.downcase + " " + item.downcase
        if command == to_test
          return true
        end
      end
    end
    return false
  end
end
