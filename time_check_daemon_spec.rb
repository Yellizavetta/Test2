# RSpec тести
RSpec.describe 'Time Checker Daemon' do
  it 'prints the current time twice within a short period' do
    output = ""

    allow($stdout).to receive(:puts) { |message| output += message + "\n" }

    thread = Thread.new do
      loop do
        current_time = Time.now
        puts "Поточний час: #{current_time}"
        sleep(60)
      end
    end
    sleep(120)  

    thread.kill

    expect(output.scan(/Поточний час: \d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/).size).to be >= 2
  end
end
