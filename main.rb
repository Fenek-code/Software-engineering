def variable_games(line)
  words = line.split(" ")
  word = words[1].downcase
  if word[-2...word.size] == "cs"
    2**word.size
  else
    words[1].reverse
  end
end

def pokemon(line)
  pokemon_array = []
  amount = line.split(" ")[0].to_i
  amount.times do
    puts 'Введите ИМЯ покемона >'
    name = gets.chomp
    puts 'Введите ЦВЕТ покемона >'
    color = gets.chomp
    pokemon_array << { 'name' => name, 'color' => color }
  end
  puts pokemon_array
end

def main
  puts 'Введите число и слово, где будет числом будет являтся количество покемонов.'
  line = gets
  puts 'работа со словом: '
  puts variable_games(line)
  puts 'работа с массивом хэшей покемонов: '
  puts pokemon(line)
end

main
