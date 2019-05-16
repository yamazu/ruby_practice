require 'csv'

csv_data = CSV.read('dummy.csv', headers: true)

csv_data.each do |data|
  dir_path = File.expand_path('~/Documents/export')

  next unless data['キャリア'] == 'ドコモ'
  Dir.mkdir(dir_path) unless Dir.exists?(dir_path)

  File.open(File.join(dir_path, "#{data['名前'].delete(' ')}.txt"), 'w') do |file|
    file.puts(<<~TEXT)
      TO: #{data['アドレス']}
      SUBJECT: #{data['名前']}様にキャンペーンのご案内です

      こんにちは。#{data['名前']}様

      お得なキャンペーンのお知らせがあります。ぜひ次のURLにアクセスしてみて下さい。

      http://example.com?email=#{data['アドレス']}
    TEXT
  end
end
