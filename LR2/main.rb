require_relative 'Student'
require_relative 'student_short'
require_relative 'Super_Student'
require_relative 'data_list'
require_relative 'data_table'
require_relative 'data_list_student_short'

student1 = Student.new(name:"Ивaн", surname:"Иванов", father_name:"Иванович", id:23, phone: "+7-928-431-41-43", tg: "@Drkmo", git: "@SMDPSKM")
student3 = Student.new(name:"Иван", surname:"Андреев", father_name:"Андреевич", id:23, phone: "+7-928-431-41-43", tg: "@Drkmo", git: "@SMDPSKM")

sh_st1=Student_short.from_student(student1)
sh_st2=Student_short.from_student(student2)
sh_st3=Student_short.from_student(student3)

puts sh_st1.to_s

list = Data_List_Student_Short.new(objects: [sh_st1, sh_st2, sh_st3])
puts(list.get_names)
puts list.get_data


