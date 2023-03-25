# Вариант № 7
# Метод 1 Найти сумму простых делителей числа.
# Метод 2 Найти количество нечетных цифр числа, больших 3.
# Метод 3 Найти произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа.


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


def sum(digit)
  s = 0
  while digit != 0
    s += digit % 10
    digit /= 10
  end
  return s
end


def delitel(digit)
  p = 1
  for i in 1..digit
    if(digit % i == 0 && sum(i) < sum(digit))
      p *= i
    end
  end
  return p
end


puts 'Введите число: '
num = gets.to_i


puts "Сумма простых делителей числа: #{sum_simple(num)}"  # Метод 1
puts "Количество нечетных цифр числа, больших 3: #{count(num)}" # Метод 2
puts "Произведение делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа: #{delitel(num)}" # Метод 3