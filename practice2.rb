require 'csv'

csv_data = CSV.read('dummy.csv', headers: true)

csv_data.each do |data|
  dir_path = "#{File.expand_path('~')}/Documents/export"
  if data['キャリア'] == 'ドコモ'
    unless Dir.exists?(dir_path)
      Dir.mkdir(dir_path)
    end

    File.open("#{dir_path}/#{data['名前'].delete(' ')}.txt", 'w') do |file|
      file.puts(<<~TEXT)
        TO: #{data['アドレス']}
        SUBJECT: #{data['名前']}様にキャンペーンのご案内です

        こんにちは。#{data['名前']}様

        お得なキャンペーンのお知らせがあります。ぜひ次のURLにアクセスしてみて下さい。

        http://example.com?email=#{data['アドレス']}
      TEXT
    end
  end
end
