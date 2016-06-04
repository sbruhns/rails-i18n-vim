require 'test_helper'

class LocaleYamlTest < Minitest::Test
  def setup
    @locale_yaml = LocaleYaml.new("./test/example_files/de.yml")
  end

  def test_line_of_key
    assert_equal 7, @locale_yaml.line_of_key("greeting.wellcome")
  end

  def test_has_key_for_non_existing_key
    assert_equal false, @locale_yaml.has_key?("greeting.key.that.dosnt.exist")
  end

  def test_has_key_for_existing_key
    assert_equal true, @locale_yaml.has_key?("greeting.wellcome")
  end

end
