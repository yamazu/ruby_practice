module KeitaiMessage
  BUTTON1 = %w(. , ! ? \ ).freeze
  BUTTON2 = %w(a b c).freeze
  BUTTON3 = %w(d e f).freeze
  BUTTON4 = %w(g h i).freeze
  BUTTON5 = %w(j k l).freeze
  BUTTON6 = %w(m n o).freeze
  BUTTON7 = %w(p q r s).freeze
  BUTTON8 = %w(t u v).freeze
  BUTTON9 = %w(w x y z).freeze
  BUTTONS = [BUTTON1, BUTTON2, BUTTON3, BUTTON4, BUTTON5, BUTTON6, BUTTON7, BUTTON8, BUTTON9].freeze

  class << self
    def convert_keitai_message
      number_of_case = gets.to_i
      array_message = []
      number_of_case.times do
        array_message.push(convert(gets.chomp))
      end
      puts array_message.join("\n")
    end

    def convert(input_message)
      input_number = ''
      count = 0
      output_message = ''
      input_message.each_char do |number|
        if number == '0'
          # 入力確定時
          unless input_number == ''
            output_message << BUTTONS[input_number.to_i-1][count%BUTTONS[input_number.to_i-1].length-1]
            count = 0
            input_number = ''
          end
        else
          # 文字選択中
          count += 1
          input_number = number
        end
      end
      output_message
    end
  end
end

KeitaiMessage.convert_keitai_message
