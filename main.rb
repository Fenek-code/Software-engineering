load 'CashMachine.rb'
require 'socket'
require 'rack'
require 'rack/utils'

server = TCPServer.new('0.0.0.0', 3000)

while connection = server.accept
  connection.write "Hello world!!"
  connection.close
end
