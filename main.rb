load 'CashMachine.rb'
require 'socket'
require 'rack'
require 'rack/utils'

server = TCPServer.new 3000
puts('Server started!')

while (connection = server.accept)

  atm = CashMachine.new
  method = 'main'
  value = nil

  # получение полного запроса
  request = connection.gets
  next if request.nil?

  full_path = request.split(' ')
  next unless full_path[0] == 'GET'

  path = full_path[1].split('/')[1]

  # получаем функцию и вводимое значение
  if !path.nil? && path.include?('?')
    method = path.split('?')[0]
    value = path.split('?')[1].split('=')[1].to_i
  elsif !path.nil?
    method = path
  end

  answer = "HTTP/1.1 200\r\nContent-Type: text/html\r\n\r\n<title>#{method}</title>"

  answer += case method
            when 'deposit'
              atm.deposit(value).to_s

            when 'debit'
              atm.write_off(value).to_s

            when 'balance'
              atm.balance.to_s

            when 'main'
              'Hi, try go by link like this:<br>

<a href="http://localhost:3000/debit?value=10">/debit?value=10</a><br>
<a href="http://localhost:3000/deposit?value=10">/deposit?value=10</a><br>
<a href="http://localhost:3000/balance">/balance</a><br>
'
            else
              'An error occurred, check the link.'
            end

  connection.print answer
  connection.close
  atm.keep_balance

end
