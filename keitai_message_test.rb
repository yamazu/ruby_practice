require 'minitest/autorun'
require './keitai_message'

class KeitaiMessageTest < Minitest::Test
  def test_convert_keitai_message
    assert_equal 'a', KeitaiMessage.convert('20')
    assert_equal 'b', KeitaiMessage.convert('220')
    assert_equal 'b', KeitaiMessage.convert('222220')
    assert_equal 'hello, world!', KeitaiMessage.convert('44033055505550666011011111090666077705550301110')
    assert_equal 'keitai', KeitaiMessage.convert('000555555550000330000444000080000200004440000')
  end
end
