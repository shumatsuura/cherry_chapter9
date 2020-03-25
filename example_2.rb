#example_2.rb　 => errorが発生するがrescueで処理を続行
puts 'Start.'
module Greeter
  def hello
    'hello'
  end
end

begin
  greeter = Greeter.new
rescue
  puts '例外が発生したが、このまま続行する'
end
puts 'End.' #実行される
