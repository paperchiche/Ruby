def minimal_el(arr)
  min = arr[0]
  for i in 0..arr.length-1.to_i
    if arr[i]<min
      min=arr[i]
    end
  end
  return min
end

def first_positive_el(arr)
  for i in 0..arr.length-1.to_i
    return i if arr[i]>0
  end
  return "Нет такого числа"
end

if ARGV.count < 2
  puts "Отсутствуют аргументы"
  return
end

method = ARGV[0]
path = ARGV[1]

file = File.open(path)
array = file.readline.split(' ').map(&:to_i)

puts "Массив, #{array}\n"
case method
when "1"
  puts "Минимальный элемент: #{minimal_el(array)}"
when "2"
  puts "Номер первого положительного элемента: #{first_positive_el(array)}"
else
  puts "Метода с таким номером нет"
end