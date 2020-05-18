require "./game/menu/menu.rb"
require "./game/quests/sorceress/herb_quest.rb"

class SorceressMenu < Menu

  def avaliable_commands
    [:talk, :buy, :sell, :quest] + super
  end

  def show_talk
    talk_options = ["magia", "balin", "kandromus"]
    talk_options << (game_symbol.symbol_name :back)

    begin
      show_options talk_options

      command = gets.chomp.downcase

      symbol = game_symbol.extract_menu_symbol command

      if (symbol != nil) && (symbol == :back)
        return
      end

      if not talk_options.include? command
        puts
        out "error_invalid_menu_option", :error
        next
      end

      puts
      case command
      when "magia"
        talk_magic
      when "balin"
        talk_balin
      when "kandromus"
        talk_kandromus
      end

    end while symbol != :back
  end

  def show_quest
    begin
      quest_options = []

      herb_quest = Factory.instance.herb_quest
      if (not player.accepted_quest?(herb_quest))
        quest_options << herb_quest.name
      end

      quest_options << (game_symbol.symbol_name :back)

      show_options quest_options

      command = gets.chomp.downcase

      symbol = game_symbol.extract_menu_symbol command

      if (symbol != nil) && (symbol == :back)
        return
      end

      quest_symbol = game_symbol.extract_quest_symbol command

      if quest_symbol == nil
        puts
        out "error_invalid_menu_option", :error
        next
      end

      puts
      case quest_symbol
      when :quest_herb
        show_herb_quest
      end

    end while symbol != :back
  end

  def show_herb_quest
    out "sorceress_says", :speak_say
    out "sorceress_quest_herb_description_1", :speak_text
    delay
    out "sorceress_says", :speak_say
    out "sorceress_quest_herb_description_2", :speak_text

    yes_no_question(method(:start_herb_quest), method(:decline_herb_quest)) {
      puts
      out "sorceress_says", :speak_say
      out "sorceress_quest_herb_unknown_answer_1", :speak_text
      delay
      out "sorceress_says", :speak_say
      out "sorceress_quest_herb_unknown_answer_2", :speak_text
    }


  end

  def start_herb_quest
    out "sorceress_says", :speak_say
    out "sorceress_quest_herb_accept_quest_1", :speak_text
    delay
    out "sorceress_says", :speak_say
    out "sorceress_quest_herb_accept_quest_2", :speak_text
    start_quest Factory.instance.herb_quest
    out "info_quest_new", :information
    wait_until_type
  end

  def decline_herb_quest
    puts
    out "sorceress_says", :speak_say
    out "sorceress_quest_herb_decline_quest", :speak_text
  end

  def talk_magic
    out "sorceress_says", :speak_say
    out "sorceress_talk_magic", :speak_text
    wait_until_type
  end

  def talk_balin
    out "sorceress_says", :speak_say
    puts "Talk about balin..".green
    puts
    wait_until_type
  end

  def talk_kandromus
    out "sorceress_says", :speak_say
    out "sorceress_talk_kandromus_1", :speak_text
    delay
    out "sorceress_says", :speak_say
    out "sorceress_talk_kandromus_2", :speak_text
    delay
    out "sorceress_says", :speak_say
    out "sorceress_talk_kandromus_3", :speak_text
    delay
    out "sorceress_says", :speak_say
    out "sorceress_talk_kandromus_4", :speak_text
    wait_until_type
  end

  def show_options options
    puts
    out "common_avaliable_options", :information
    if options.size == 1
      puts text("common_no_options").yellow
      puts
    end
    options.each do |name|
      puts name.green
    end
    puts
  end
end
