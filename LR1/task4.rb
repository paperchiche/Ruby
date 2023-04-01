def cyclic_shift_2_right(array) #7 - сдвигает элементы массива на две позиции вправо
  return array[0..-3].unshift(array[-2])
end

def cyclic_shift_1_right(array) #19 - сдвигает элементы массива на одну позицию вправо
  return array[0...-1].unshift(array[-1])
end


def select_method(num_method, file_name) #функция принимает два значения номер функция и имя файла (путь) с массивом чисел возвращает значение выбраной функции указаного массива 
  array = IO.read(file_name).split.map(&:to_i)
  case num_method
  when "1"
    return cyclic_shift_2_right(array)
  when "2"
    return cyclic_shift_1_right(array)
  end
end

puts select_method(ARGV[0], ARGV[1])