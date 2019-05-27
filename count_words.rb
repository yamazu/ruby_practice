class CountWords
  class << self
    def count
      file_path = File.expand_path('../resource/input.txt', __FILE__)
      text = File.read(file_path)
      count_table = Hash.new(0)

      word_char = '[\w’\/-]'
      regex_idioms = /[A-Z]#{word_char}*(?: of| [A-Z]#{word_char}*)+/
      regex_words = /#{word_char}+/
      regex = Regexp.union(regex_idioms, regex_words)
      # 英熟語・英単語の出現回数をカウント
      text.gsub(regex) { |word| count_table[word] += 1 }

      # 英熟語と英単語のハッシュに分離
      count_table_idioms, count_table_words = count_table.partition { |word, _| word.include?(' ') }

      # 結果出力
      total_word_count = count_table_words.inject(0) { |sum, (_, count)| sum + count }
      puts "単語数（熟語以外）：#{total_word_count}"
      output_result(count_table_idioms, '英熟語？')
      output_result(count_table_words, '英単語')
    end

    private

    def output_result(count_table, header)
      puts "#{header}------------------------------------------------------------------"
      count_table_group_by_count = Hash.new { [] }
      count_table.each do |word, count|
        count_table_group_by_count[count] = count_table_group_by_count[count].push(word)
      end
      count_table_group_by_count.sort.reverse.to_h.each do |count, words|
        words.sort_by(&:downcase).each { |word| puts "#{count.to_s.rjust(3)} #{word}" }
      end
    end
  end
end
