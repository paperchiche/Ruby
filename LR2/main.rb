require_relative 'student'
require_relative 'student_short'
require_relative 'Super_Student'

student = Student.new(name:"Иван", surname:"Иванов", father_name:"Иванович", id:23, phone: "+7-928-431-41-43", tg: "@Drkmo", git: "@SMDPSKM")
puts student.to_s
puts student.validate

puts student.getInfo


