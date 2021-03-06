require 'yaml'

module Language
  @@language = nil
  @@hash = nil

  def language_was_set?
    @@language != nil
  end

  def text key
    if not language_was_set?
      puts "Default language was not set"
      return
    elsif not @@hash.include? key
      puts "Key #{key} was not found"
      return
    end
    @@hash[key]
  end

  def text_with_var key, var
    to_be_modified = text key
    to_be_modified.replace_between("*","*",var.to_s)
  end

  def load_language language
    @@language = language

    @@hash = get_labels @@language
  end

  def get_labels language
    read_yaml "/translation/#{language}/labels_#{language}.yml"
  end

  def read_yaml file
    YAML::load_file(File.join(Dir.pwd,file))
  end
end
