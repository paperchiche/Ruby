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


def count(digit)
  k = 0
  while digit != 0
    s = digit % 10
    if(s % 2 != 0 and s > 3)
      k += 1
    end
    digit /= 10
  end
  return k
end

puts 'Введите число: '
num = gets.to_i

puts "Сумма простых делителей числа: #{sum_simple(num)}"  # Сумма простых делителей числа
puts "Количество нечетных цифр числа, больших 3: #{count(num)}" # Количество нечетных цифр числа, больших 3