require 'minitest/autorun'
require_relative './count_words'

class CountWordsTest < Minitest::Test
  def test_count_words
    assert_output(expected_text) { CountWords.count }
  end

  private

  def expected_text
    file_path = File.expand_path('../expected_output.txt', __FILE__)
    File.read(file_path)
  end
end
