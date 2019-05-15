require 'csv'
require 'date'

def calc_age(birthday, reference_date)
  if birthday !~ /^[0-9]{8}$/
    return -1
  end
  return (reference_date.to_i - birthday.to_i) / 10000
end

csv_data = CSV.read('dummy.csv', headers: true)

header = ['名前', '誕生日', 'オリンピック開催日年齢']
CSV.open('output.csv', 'w') do |file|
  file << header

  csv_data.each do |data|
    birthday_year = data['誕生日'].split('/')[0]
    birthday_month = data['誕生日'].split('/')[1].rjust(2, '0')
    birthday_day = data['誕生日'].split('/')[2].rjust(2, '0')
    birthday = birthday_year + birthday_month + birthday_day
    reference_date = '20200724'
    age = calc_age(birthday, reference_date)

    if (30..40).include?(age) && data['性別'] == '女'
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
