module Controller

  def yes_no_question(method_yes, method_no)
    yes_command = ["yes","y","sim","s"]
    no_command = ["no","n","não","nao","n"]

    yes_or_no_was_chosen = false

    until yes_or_no_was_chosen
      command = gets.chomp.downcase

      if yes_command.include? command
        yes_or_no_was_chosen = true
        method_yes.call
      elsif no_command.include? command
        yes_or_no_was_chosen = true
        method_no.call
      else
        yield
      end
    end
  end
end
