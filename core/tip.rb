module Tip
  @@tips = true

  def tips key, need_split=true
    full_text = text(key)
    if need_split
      splited_text = full_text.split('*')
      full_text = splited_text[0].cyan + splited_text[1].blue + splited_text[2].cyan
    end
    puts text("tips_label").cyan + " - " + full_text
  end

  def tips?
    @@tips
  end

  def show_tips
    @@tips = true
  end

  def hide_tips
    @@tips = false
  end
end
