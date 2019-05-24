class CountWords
  def self.count
    file_path = File.expand_path('../resource/input.txt', __FILE__)
    text = File.read(file_path)
    hash_idioms = Hash.new(0)
    hash_words = Hash.new(0)

    total_number_of_words = 0
    text.gsub(/\w+/) do |word|
      hash_words[word] += 1
      total_number_of_words += 1
    end
    puts "単語数（熟語以外）：#{total_number_of_words}"
    puts "英単語------------------------------------------------------------------"
    # hash_words
    #   .sort_by { |word, count| -count }
    #   .to_h
    #   .each { |word, count| puts "#{count.to_s.rjust(3)} #{word}" }
    hash_words_group_by_count = Hash.new { [] }
    hash_words.each do |word, count|
      hash_words_group_by_count[count] = hash_words_group_by_count[count].push(word)
    end
    hash_words_group_by_count.sort.reverse.to_h.each do |count, words|
      words.sort.each { |word| puts "#{count.to_s.rjust(3)} #{word}" }
    end
  end
end

CountWords.count
