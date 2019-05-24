class Bingo
  def self.generate_card
    array_bingo = [(1..15), (16..30), (31..45), (46..60), (61..75)].map do |range_bingo|
      range_bingo.to_a.sample(5)
    end

    array_bingo[2][2] = ''
    array_bingo = array_bingo.transpose.insert(0, %w(B I N G O))

    array_bingo.map { |line_bingo|
      line_bingo.map { |cell| cell.to_s.rjust(2) }.join(' | ')
    }.join("\n")
  end
end

puts Bingo.generate_card
