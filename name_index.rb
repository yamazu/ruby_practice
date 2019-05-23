class NameIndex
  def self.create_index(names)
    names.sort.group_by { |name|
      case name[0]
      when 'ア'..'オ' then 'ア'
      when 'カ'..'ゴ' then 'カ'
      when 'サ'..'ゾ' then 'サ'
      when 'タ'..'ド' then 'タ'
      when 'ナ'..'ノ' then 'ナ'
      when 'ハ'..'ポ' then 'ハ'
      when 'マ'..'モ' then 'マ'
      when 'ヤ'..'ヨ' then 'ヤ'
      when 'ラ'..'ロ' then 'ラ'
      when 'ワ'..'ン' then 'ワ'
      end
    }.to_a
  end
end
