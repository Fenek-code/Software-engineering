class CashMachine

  def initialize
    @balance = 100.0

    if File.exist?('balance.txt')
      f = File.open('balance.txt')
      @balance = f.read.to_f
      f.close
    end
  end

  def get_deposit(sum)
    if !sum.positive?
      puts 'Сумма должна быть больше нуля'
    else
      @balance += sum
      puts "Ваш новый баланс: #{@balance}"
    end
  end

  def get_write_off(sum)
    if sum <= 0
      puts 'Сумма должна быть больше нуля'
    elsif sum > @balance
      puts 'Недостаточно средств'
    else
      @balance -= sum
      puts "Ваш новый баланс: #{@balance}"
    end
  end

  def keep_balance
    f = File.open('balance.txt', 'w')
    f.write(@balance)
    f.close
  end

  def init
    loop do
      puts "[B] Баланс
[D] Депозит
[W] Списание
[Q] Выход"

      choose = gets.chomp
      case choose.downcase

      when 'b'
        puts "Ваш баланс: #{@balance}"

      when 'd'
        puts 'Введите сумму для депозита'
        get_deposit(gets.to_f)

      when 'w'
        puts 'Введите сумму для списания'
        get_write_off(gets.to_f)

      when 'q'
        return 0

      else
        puts 'Выбор неизвестен'
      end

      keep_balance
    end
  end
end
