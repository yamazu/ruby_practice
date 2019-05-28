require 'minitest/autorun'
require './sum_matrix'

class TestSumMatrix < Minitest::Test
  def test_sum_matrix
    input = [
        [9, 85, 92, 20],
        [68, 25, 80, 55],
        [43, 96, 71, 73],
        [43, 19, 20, 87],
        [95, 66, 73, 62]
    ]
    expected = [
        [9, 85, 92, 20, 206],
        [68, 25, 80, 55, 228],
        [43, 96, 71, 73, 283],
        [43, 19, 20, 87, 169],
        [95, 66, 73, 62, 296],
        [258, 291, 336, 297, 1182]
    ]

    assert_equal expected, SumMatrix.sum_matrix(input)
  end

  def test_format_matrix_max_400
    input = [
        [1, 2, 3, 4],
        [100, 200, 300, 400]
    ]
    expected = <<-TEXT.chomp
  1|  2|  3|  4
100|200|300|400
    TEXT

    assert_equal expected, SumMatrix.format_matrix(input)
  end

  def test_format_matrix_max_40
    input = [
        [1, 2, 3, 4],
        [10, 20, 30, 40]
    ]
    expected = <<-TEXT.chomp
 1| 2| 3| 4
10|20|30|40
    TEXT

    assert_equal expected, SumMatrix.format_matrix(input)
  end

  def test_generate_matrix
    matrix = SumMatrix.generate_matrix(col: 4, row: 5, number_range: 1..99)
    assert_equal 5, matrix.size
    assert matrix.all?{|row| row.size == 4 }
    assert matrix.flatten.all?{|n| n.between?(1, 99) }

    matrix2 = SumMatrix.generate_matrix(col: 4, row: 5, number_range: 1..99)
    assert matrix != matrix2, 'ランダムな結果が得られること'
  end

  # テストしたいというよりも結果が見たいだけ
  def test_generate_sum_matrix
    result = SumMatrix.generate_sum_matrix
    puts result
    assert result.is_a?(String)
  end
end
