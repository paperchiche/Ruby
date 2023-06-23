require_relative 'student'

student = Student.new(name:"Иванов", surname:"Иван", father_name:"Иванович", id:23, phone: "+7-928-431-41-43", tg:"@D-rk_mo", git:"@SMDPSKM")
puts student.to_s
puts student.validate


