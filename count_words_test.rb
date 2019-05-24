require 'minitest/autorun'
require_relative './count_words'

class CountWordsTest < Minitest::Test
  def test_count_words
    assert_equal expected_text, CountWords.count(input_file_path)
  end

  private

  def input_file_path
    File.expand_path('../resource/input.txt', __FILE__)
  end

  def expected_text
    file_path = File.expand_path('../expected_output.txt', __FILE__)
    File.read(file_path).strip
  end
end
