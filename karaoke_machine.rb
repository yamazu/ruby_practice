class KaraokeMachine
  SCALE = %w(C C# D D# E F F# G G# A A# B).freeze

  def initialize(melody)
    @melody = melody
  end

  # def transpose(amount)
  #   transposed_melody = ''
  #   array_melody = @melody.each_char.to_a
  #   array_melody.each_with_index do |value, index|
  #     # '#'の場合は、次の文字へスキップ
  #     next if value == '#'
  #     # 次の文字が'#'の場合は、今の音階に#を付与
  #     value += array_melody[index + 1] if array_melody[index + 1] == '#'

  #     if value == ' ' || value == '|'
  #       # 休符または小節の区切りはそのまま出力
  #       transposed_melody += value
  #     else
  #       # 音階の場合は、キーを変更
  #       transposed_melody += SCALE[(SCALE.index(value) + amount) % 12]
  #     end
  #   end
  #   transposed_melody
  # end

  # 解答例1
  def transpose(amount)
    @melody.gsub(/[A-G]#?/) { |k| SCALE[(SCALE.index(k)+amount) % 12] }
  end
end
