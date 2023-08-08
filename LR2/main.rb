require_relative 'Student'
require_relative 'student_short'
require_relative 'Super_Student'
require_relative 'data_list'
require_relative 'data_table'
require_relative 'data_list_student_short'
require 'mysql2'

str="name:Василий, surname:Васнецов, father_name:Анатольевич, id:11, git:@fdsa, tg:@qpfms"


@db_host  = "localhost"
@db_user  = "root"
@db_pass  = "12345"
@db_name = "students"

client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass, :database => @db_name)

results = client.query("SELECT * FROM student", symbolize_keys: true)

results.each { |r|
  puts Student.new(**r).to_s
  puts
}