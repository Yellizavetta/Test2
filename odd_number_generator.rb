require 'thread'

number_queue = Queue.new

number_generator = Thread.new do
  num = 1
  loop do
    number_queue << num  
    num += 1
    sleep(1)  
  end
end

odd_number_printer = Thread.new do
  loop do
    number = number_queue.pop  
    puts "Непарне число: #{number}" if number.odd?
  end
end

number_generator.abort_on_exception = true
odd_number_printer.abort_on_exception = true

loop do
  sleep(1)
end
