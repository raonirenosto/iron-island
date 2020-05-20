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
      magic_herbs = Factory.instance.magic_herbs

      # Show magic herbs quest if was not taken yet
      if (not player.accepted_quest?(herb_quest))
        quest_options << herb_quest.name
      end

      if (herb_quest.started?)
        if player.in_the_bag? magic_herbs
          quest_options << (game_symbol.symbol_name :quest_herb_finish)
        end
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

      if quest_symbol == :quest_herb
        if not herb_quest.started?
          show_herb_quest
        end
      end

      if quest_symbol == :quest_herb_finish
        if herb_quest.started? and (player.in_the_bag? magic_herbs)
          deliver_magical_herbs
        end
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

  def deliver_magical_herbs
    out "sorceress_says", :speak_say
    out "sorceress_deliver_herbs_1", :speak_text
    delay
    out "sorceress_says", :speak_say
    out "sorceress_deliver_herbs_2", :speak_text
    delay
    out "sorceress_deliver_remove_herbs_from_bag", :information
    magic_herbs = Factory.instance.magic_herbs
    player.remove_from_bag magic_herbs
    delay
    out "sorceress_deliver_herbs_to_aria", :information
    delay
    out "sorceress_says", :information
    out "sorceress_deliver_herbs_3", :speak_text
    delay
    out "sorceress_give_coins", :information
    player.add_coins 5
    finish_magic_herbs_quest
  end

  def finish_magic_herbs_quest
    magic_herbs_quest = Factory.instance.herb_quest
    player.finish_quest magic_herbs_quest
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
