require 'minitest/autorun'
require './name_index'

class NameIndexTest < Minitest::Test
  def test_create_index
    assert_equal [], NameIndex.create_index([])
    assert_equal [ ['ア', ['イトウ']], ['カ', ['カネダ', 'キシモト']], ['ハ', ['ハマダ', 'ババ']], ['ワ', ['ワダ']] ], NameIndex.create_index(['キシモト', 'イトウ', 'ババ', 'カネダ', 'ワダ', 'ハマダ'])
  end
end
