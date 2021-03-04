def variable_games(line)
  words = line.split(" ")
  word = words[1].downcase
  if word[-2...word.size] == "cs"
    2**word.size
  else
    words[1].reverse
  end
end

def pokemons
  amount = gets.to_i
  amount.times do

  end
end

def main
  line = gets
  #puts variable_games(line)
  puts pokemons
end

main
