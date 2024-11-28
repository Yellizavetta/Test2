require 'thread'

Thread.new do
  loop do
    current_time = Time.now
    puts "Поточний час: #{current_time}"
    sleep(60)
  end
end

# Поміщення потоку в режим демона
Thread.list.each do |t|
  if t != Thread.main
    t.abort_on_exception = true
    t.run
  end
end

loop do
  sleep(1)
end
