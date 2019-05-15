require 'csv'
require 'date'

def calc_age(birthday, reference_date)
  age = reference_date.year - birthday.year
  if birthday.month > reference_date.month ||
    (birthday.month == reference_date.month && birthday.day > reference_date.day)
    # 誕生日を迎えていない場合
    age -= 1
  else
    # 誕生日を迎えている場合
    age
  end
end

csv_data = CSV.read('dummy.csv', headers: true)

header = ['名前', '誕生日', 'オリンピック開催日年齢']
CSV.open('output.csv', 'w') do |file|
  file << header

  csv_data.each do |data|
    birthday = Date.parse(data['誕生日'])
    reference_date = Date.new(2020, 7, 24)
    age = calc_age(birthday, reference_date)

    if (30..40).include?(age) && data['性別'] == '女'
      # 2020年7月24日時点で30歳〜40歳の女性を抽出
      file << [data['名前'], data['誕生日'], age]
    end
  end
end

# csv_data.each do |data|
#   birthday = Date.parse(data['誕生日'])
#   reference_date = Date.new(2020, 7, 24)
#   age = Birthday.calc_age(birthday, reference_date)

#   if 30 <= age && age <= 40 && data['性別'] == '女'
#     output_data = [data['名前'], data['誕生日'], age]
#     output_data_list << output_data
#   end
# end

# header = ['名前', '誕生日', 'オリンピック開催日']
# CSV.open('output.csv', 'w') do |file|
#   file << header
#   output_data_list.each do |data|
#     file << data
#   end
# end
