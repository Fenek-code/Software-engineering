def reverse(a_s)
  temp_a_s = ''
  i = a_s.size
  while i.positive?
    temp_a_s += a_s[i].to_s
    i -= 1
  end
  temp_a_s
end

def variable_games(a_i, b_s)
  length = b_s.size
  ending = b_s[(length - 2)...length]

  if ending == 'CS'
    2**length
  else
    reverse(b_s)
  end
end

def main
  puts variable_games(0, 'asddasCS')
end

main
