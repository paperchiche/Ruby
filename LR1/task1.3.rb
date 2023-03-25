puts "Введите команду языка Ruby"
cmd_ruby = gets.chomp
system "ruby -e \"#{cmd_ruby}\""

puts "Введите команду ОС"
cmd_os = gets.chomp
system cmd_os
