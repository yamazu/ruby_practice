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
    birthday = Date.new(data['誕生日']).strftime('yyyymmdd')
    reference_date = '20200724'
    age = calc_age(birthday, reference_date)

    if (30..40).include?(age) && data['性別'] == '女'
      # 2020年7月24日時点で30〜40際の女性を抽出
      file << [data['名前'], data['誕生日'], age]
    end
  end
end
