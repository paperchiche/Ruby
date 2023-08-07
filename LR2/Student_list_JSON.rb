class Student_list_JSON<Basic_format
  require_relative 'Basic_list'
  require_relative 'student'
  require_relative 'Data_List_Student_Short'
  require_relative 'student_short'


  def hash_to_format(hash)
    return hash.to_json
  end

  def format_to_hash(str)
    return JSON.parse(str)
  end

end