module SumMatrix
  class << self
    def generate_sum_matrix(col: 4, row: 5, number_range: 1..99)
      matrix = generate_matrix(col: col, row: row, number_range: number_range)
      matrix = sum_matrix(matrix)
      format_matrix(matrix)
    end

    def generate_matrix(col:, row:, number_range:)
      Array.new(row) { number_range.to_a.sample(col) }
    end

    def sum_matrix(matrix)
      # 各行の合計
      matrix.each { |row| row.push(row.sum) }
      # 各列の合計
      matrix.transpose.each { |row| row.push(row.sum) }.transpose
    end

    def format_matrix(matrix)
      display_length = matrix.last.max.to_s.length
      # 行列の各要素を整形
      matrix.map do |row|
        row.map { |cell| cell.to_s.rjust(display_length) }.join('|')
      end.join("\n")
    end
  end
end
