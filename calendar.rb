require 'date'

today = Date.today
current_year = today.year
current_month = today.month

first_day = Date.new(current_year, current_month, 1)
last_day = Date.new(current_year, current_month, -1)

puts today.strftime('%B %Y').center(20)
puts 'Su Mo Tu We Th Fr Sa'

# 1日より前をスペース埋め
string_calendar = '   ' * first_day.wday
# 最終日まで文字列に格納
last_day.day.times do |n|
  string_calendar += "#{(n+1).to_s.rjust(2, ' ')}"
  if string_calendar.gsub(/(\n)/,"").length % 20 == 0
    # 土曜日まで来ると改行
    string_calendar += "\n"
  else
    # それ以外の曜日はスペースを開ける
    string_calendar += ' '
  end
end
puts string_calendar
