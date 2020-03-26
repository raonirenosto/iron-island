module Menu

  @@texts = []
  @@actions = []

  def add_text_menu label, text
    @@texts.push << {label: label, text: text}
  end

  def add_action_menu
    @@actions.push << {label: label, text: text}
  end
end
