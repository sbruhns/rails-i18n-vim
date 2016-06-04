class LocaleYaml
  require 'yaml'

  attr_reader :locale, :file_path

  def initialize(filepath)
    @file_path = filepath
    parse_file
  end
  
  def line_of_key(translation_key)
    entry_for_key(translation_key)["line"] 
  end

  def has_key?(translation_key)
    entry_for_key(translation_key).nil? ? false : true 
  end

  def translations_hash
    @parsed_content[locale]
  end

  private
  def entry_for_key(translation_key)
    key_nodes = translation_key.split(".")

    sub_hash = translations_hash 
    key_nodes.each do |key_node|
      sub_hash = sub_hash[key_node]
      return nil if sub_hash.nil?
    end

    sub_hash
  end

  def parse_file
    file = File.open(file_path)
    @parsed_content ||= LocaleFileParser.new(file).parsed_content
    parse_locale
  end

  def parse_locale
    @locale = @parsed_content.keys.first
  end
end
