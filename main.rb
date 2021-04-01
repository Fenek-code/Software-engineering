load 'Entities/CashMachine.rb'
load 'Entities/Router.rb'

def main
  loop do
    puts "[1] \tРабота с банком
[2] \tРабота с сайтом
[-1]\tВыход"

    choose = gets.to_i
    case choose
    when 1
      bank = CashMachine.new
      bank.init
    when 2
      router = Router.new
      router.init
    when -1
      break
    else
      puts 'Выбор неизвестен'
    end
  end
end

main
