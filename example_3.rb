begin
  1 / 0
rescue => e
 puts "クラス: #{e.class}"
 puts "メッセージ: #{e.message}"
 puts "バックトレース: #{e.backtrace}"
end
