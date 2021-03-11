def students
  file = File.open('students list.txt')
  students = file.read.split("\n")
  file.close
  result = []
  puts 'Введите -1 для прекращения поиска'
  loop do
    puts 'Введите возраст студента'
    input = gets.to_i
    break if input == -1  # для выхода ввести -1

    students.each do |student|
      result.append(student) if student.split(' ')[2].to_i == input
    end
    break if students.length == result.length
  end

  file = File.open('result.txt', 'w')
  result.each do |s|
    puts s
    file.write("#{s}\n")
  end
  file.close
end

def bank
  balance = 100.0
  if File.exist?('balance.txt') # проверка существования файла
    f = File.open('balance.txt')
    balance = f.read.to_f
    f.close
  end
  loop do
    puts '[B] Баланс'
    puts '[D] Депозит'
    puts '[W] Списание '
    puts '[Q] Выход'

    choose = gets.chomp
    case choose.downcase
    when 'd'
      puts 'Введите сумму для депозита'
      sum = gets.to_f
      if !sum.positive?
        puts 'Сумма должна быть больше нуля'
      else
        balance += sum
        puts "Ваш новый баланс: #{balance}"
      end
    when 'w'
      puts 'Введите сумму для списания'
      sum = gets.to_f
      if sum <= 0
        puts 'Сумма должна быть больше нуля'
      elsif sum > balance
        puts 'Недостаточно средств'
      else
        balance -= sum
        puts "Ваш новый баланс: #{balance}"
      end
    when 'b'
      puts "Ваш баланс: #{balance}"
    when 'q'
      f = File.open('balance.txt', 'w')
      f.write(balance)
      f.close
      break
    else
      puts 'Выбор неизвестен'
    end
  end
end

def main
  loop do
    puts "[1] \tНайти студента по возрасту"
    puts "[2] \tБанк"
    puts "[-1]\tВыход"

    choose = gets.to_i
    case choose
    when 1
      students
    when 2
      bank
    when -1
      break
    else
      puts 'Выбор неизвестен'
    end
  end
end

main
