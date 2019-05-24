require 'csv'
require 'date'

class SyukujitsuParser
  CSV_PATH = File.expand_path('../resource/syukujitsu.csv', __FILE__)

  def self.parse(csv_path = CSV_PATH)
    hash_syukujitsu = {}
    CSV.foreach(csv_path, encoding: 'CP932:UTF-8').with_index do |row, row_no|
      if row_no == 0
        # CSV1行目で年の取得
        row.each_with_index do |cell, cell_no|
          next if cell_no.odd?
          hash_syukujitsu[cell.slice(/\d{4}/).to_i] = {}
        end
      else
        # CSV2行目以降は各祝日をハッシュ化
        row.each_with_index do |cell, cell_no|
          next if cell_no.odd?
          date = Date.parse(row[cell_no + 1]) rescue nil
          hash_syukujitsu[date.year][date] = cell if date
        end
      end
    end
    hash_syukujitsu
  end
end
