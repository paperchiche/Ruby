class Student_list_YAML<Basic_list
  require_relative 'Basic_list'
  require_relative 'data_list_student_short'
  require_relative 'student_short'
  require 'yaml'

  def read_list
    file = File.open(self.file, "r")
    text = file.read
    yaml_hash = YAML.parse(text)
    self.list = yaml_hash.map {|hash| Student.new(**hash)}
  end

  def write_list
    objects_array = self.list.map do |stud|
      arr = stud.map do |name, value|
        [name.to_s, value]
      end
      arr.to_h
    end
    yaml_text = YAML.pretty_generate(objects_array)
    file_text = File.open(file, "w")
    file_text.write(yaml_text)
    file_text.close
  end
  
end