require_relative 'Student'
require_relative 'student_short'
require_relative 'Super_Student'
require_relative 'data_list'
require_relative 'data_table'
require_relative 'data_list_student_short'
require 'mysql2'

student1 = Student.new(name:"Ивaн", surname:"Иванов", father_name:"Иванович", id:34, phone: "+7-928-431-41-43", tg: "@Drkmo", git: "@SMDPSKM")
student3 = Student.new(name:"Иван", surname:"Андреев", father_name:"Андреевич", id:45, phone: "+7-928-431-41-43", tg: "@Drkmo", git: "@SMDPSKM")

sh_st1=Student_short.from_student(student1)
sh_st2=Student_short.from_student(student2)
sh_st3=Student_short.from_student(student3)

str="name:Василий, surname:Васнецов, father_name:Анатольевич, id:11, git:@fdsa, tg:@qpfms"
sh_st4=Student_short.parse_str(str)

puts sh_st4.to_s

list = Data_List_Student_Short.new(objects: [sh_st1, sh_st2, sh_st3, sh_st4])
puts(list.get_names)
puts(list.get_data)

list.select(1)
puts list.get_selected

@db_host  = "localhost"
@db_user  = "root"
@db_pass  = "12345"
@db_name = "students"

client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass, :database => @db_name)

results = client.query("SELECT * FROM student", symbolize_keys: true)

results.each { |r|
  puts Student.new(**r)
  puts
}