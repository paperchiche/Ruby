require 'mysql2'

@db_host  = "localhost"
@db_user  = "root"
@db_pass  = "12345"
@db_name = "students"

client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass, :database => @db_name)