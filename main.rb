def students
  file = File.open('students list.txt')
  students = file.read.lines
  file.close
  result = []
  puts 'Введите -1 для прекращения поиска'
  loop do
    puts 'Введите возраст студента'
    input = gets.to_i
    break if input == -1

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
  if File.exist?('balance.txt')
    f = File.open('balance.txt')
    balance = f.read.to_f
    f.close
  end
  loop do
    puts "[B] Баланс
[D] Депозит
[W] Списание
[Q] Выход"

    choose = gets.chomp
    case choose.downcase
    when 'b'
      puts "Ваш баланс: #{balance}"
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
    when 'q'
      break
    else
      puts 'Выбор неизвестен'
    end
    f = File.open('balance.txt', 'rw')
    f.write(balance)
    f.close
  end
end

def main
  loop do
    puts "[1] \tНайти студента по возрасту
[2] \tБанк
[-1]\tВыход"

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