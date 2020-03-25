#例外処理とは、、
#おそらく「例外=エラー」
#なので、エラーが出た時の処理
#通常はエラーが発生した時はその時点で処理が中断される

#example_1.rbを実施 => Greeter.newでerrorが発生
puts 'Start.'
module Greeter
  def hello
    'hello'
  end
end
greeter = Greeter.new
puts 'End.' #実行されない

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

#基本的には、安易には使わない。(=> エラーが発生する場合は原因を調査、修正すべき。railsの共通処理に委ねた方が安全。)
#使う例、メール。P344
#条件分岐も一つの手段 P345（=> valid_date?などでデータが有効かチェックするなど。）

#それでも使う場合は、1.エラー情報を残す、2.対象範囲、対象クラスを絞る

# example_3.rbを実施 => 例外オブジェクトから情報を取得
begin
  1 / 0
rescue => e
 puts "クラス: #{e.class}"
 puts "メッセージ: #{e.message}"
 puts "バックトレース: #{e.backtrace}"
end

#エラークラスについてP337

#example_4.rbを実行 => rescueされる
begin
  1 / 0
rescue ZeroDivisionError
  puts "0で除算しました"
end

#example_5.rbを実行 => rescueされない
begin
  'abc'.foo
rescue ZeroDivisionError
  puts "0で除算しました"
end

# 複数クラス捕捉のケース（間違い）。example_6.rbを実行　=>  NoMethodErrorは捕捉されない。
begin
  'abc'.foo
rescue NameError
  puts 'NameErrorです'
rescue NoMethodError
  puts 'NoMethodErrorです' #NameErrorを継承してるクラスなので実行されない
end

# 複数クラス捕捉のケース（OK）。example_7.rbを実行　=>  NoMethodErrorで捕捉される。
begin
  'abc'.foo
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
end

#resucue内にretryで処理を再実行できる P340
#raiseで意図的に例外を発生させる P341
#case文の場合、elseはrescueにする  P346
