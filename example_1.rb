#example_1.rbを実施 => Greeter.newでerrorが発生
puts 'Start.'
module Greeter
  def hello
    'hello'
  end
end
greeter = Greeter.new
puts 'End.' #実行されない
