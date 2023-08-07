class Student_list_JSON<Basic_list
  require_relative 'Basic_list'
  require_relative 'student'
  require_relative 'Data_List_Student_Short'
  require_relative 'student_short'


  def read_list
    file = File.open(self.file, "r")
    text = file.read
    json_hash = JSON.parse(text)
    self.list = json_hash.map {|hash| Student.new(**hash)}
  end

  def write_list
    objects_array = self.list.map do |stud|
      arr = stud.map do |name, value|
        [name.to_s, value]
      end
      arr.to_h
    end
    json_text = JSON.pretty_generate(objects_array)
    file_text = File.open(file, "w")
    file_text.write(json_text)
    file_text.close
  end

end