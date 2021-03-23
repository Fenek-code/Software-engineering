load 'Entities/Bank.rb'

def main
  loop do
    puts "[1] \tРабота с банком
[2] \tРабота с сайтом
[-1]\tВыход"

    choose = gets.to_i
    case choose
    when 1
      bank = Bank.new
      bank.work
    when -1
      break
    else
      puts 'Выбор неизвестен'
    end
  end
end

main
