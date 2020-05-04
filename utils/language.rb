require 'yaml'

module Language
  @@language = nil
  @@hash = nil

  def language_was_set?
    @@language != nil
  end

  def text key
    @@hash[key]
  end

  def set_language language
    @@language = language

    @@hash = get_labels @@language
  end

  def get_labels language
    read_yaml "../translation/#{language}/labels_#{language}.yml"
  end

  def read_yaml file
    YAML::load_file(File.join(__dir__, file))
  end
end
