def simple(digit)
  for i in 2...digit do
    if digit%i == 0
      return false
    end
  end
  return true
end

def sum_simple(digit)
  sum = 0
  for i in 2..digit do
    if digit%i == 0 && simple(i)
      sum += i
    end
  end
  return sum
end

puts 'Введите число: '
num = gets.to_i

puts "Сумма простых делителей числа: #{sum_simple(num)}"  # Сумма простых делителей числа