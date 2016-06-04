require "rails_i18n_lib/locale_yaml"
require "rails_i18n_lib/locale_file_parser"

module RailsI18nLib
  def self.key_exist?(locale_file_path: ,translation_key:)
    LocaleYaml.new(locale_file_path).has_key?(translation_key)
  end

  def self.get_line_for_key(locale_file_path: ,translation_key:)
    LocaleYaml.new(locale_file_path).line_of_key(translation_key)
  end
end
