# @return [nil]
def hello
  puts 'Введите имя >'
  name = gets.chomp
  puts 'Введите фамилию >'
  lastname = gets.chomp
  puts 'Введите возраст >'
  age = gets.to_i


  answer = if age < 18
             "Привет, #{name} #{lastname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано!"
           else
             "Привет, #{name} #{lastname}. Самое время заняться делом!"
           end
  puts answer.gsub("\n", '')
end

# @return [Integer]
def take_couple (a, b)
  if (a == 20) || (b == 20)
    20
  else
    a + b
  end
end

# Точка входа:
# @return [nil]
def main
  loop do
    puts "\n1. Скрипт, который будет запрашивать имя,
      фамилию и возраст, а затем выдавать приветствие в одном из двух вариантов,
      в зависимости от возраста.
2. Скрипт, который принимает пару чисел,
      если хотя бы одно равно 20 - возвращает его, в противном случае выводит сумму этих чисел.
q для выхода\n>"

    choice = gets.chomp
    system('cls')
    case choice
    when '1'
      hello
      puts("\n")

    when '2'
      puts 'Значение a >'
      a = gets.to_i
      puts 'Значение b >'
      b = gets.to_i
      puts("\nИтог: #{take_couple(a, b)}\n")

    when 'q'
      break

    else
      next
    end
  end
end

main  # запуск точки входа