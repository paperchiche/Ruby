puts "Как Вас зовут?"

if ARGV.count < 1
  name = "Брат"
else name = ARGV[0]
end
puts "Hello, #{name}! Какой твой любимый язык программирования?"
language = gets.chomp
case language
when "Python"
  puts "Превосходно! Но скоро будет Ruby!"
when "C#"
  puts "Ситуация патовая. Но скоро будет Ruby!"
when "Prolog"
  puts "Мы не знаем, что это такое. Но скоро будет Ruby!"
when "F#"
  puts "Мы не знаем, что это такое, если бы мы знали, что это такое, мы не знаем, что это такое. Но скоро будет Ruby!"
when "Ruby"
  puts "Вы подлиза!"
else
  puts "Скоро будет Ruby"
end

