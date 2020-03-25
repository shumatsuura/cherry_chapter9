begin
  'abc'.foo
rescue NameError
  puts 'NameErrorです'
rescue NoMethodError
  puts 'NoMethodErrorです' #NameErrorを継承してるクラスなので実行されない
end
