# @return [nil]
def hello
  printf 'Введите имя >'
  name = gets
  printf 'Введите фамилию >'
  lastname = gets
  printf 'Введите возраст >'
  age = gets.to_i


  answer = if age < 18
             "Привет, #{name} #{lastname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано!"
           else
             "Привет, #{name} #{lastname}. Самое время заняться делом!"
           end
  printf answer.gsub("\n", '')
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
    printf "\n1. Скрипт, который будет запрашивать имя,
      фамилию и возраст, а затем выдавать приветствие в одном из двух вариантов,
      в зависимости от возраста.
  2. Скрипт, который принимает пару чисел,
      если хотя бы одно равно 20 - возвращает его, в противном случае выводит сумму этих чисел.\n>"

    choice = gets.delete("\n")
    system('cls')
    case choice
    when '1'
      hello
      print("\n")

    when '2'
      printf 'Значение a >'
      a = gets.to_i
      printf 'Значение b >'
      b = gets.to_i
      print("\nИтог: #{take_couple(a, b)}\n")

    when 'q'
      break

    else
      next
    end
  end
end

main  # запуск точки входа