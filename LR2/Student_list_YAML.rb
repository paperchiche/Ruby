class Student_list_YAML
  require_relative 'student'
  require_relative 'Data_List_Student_Short'
  require_relative 'student_short'
  require 'yaml'

  attr_accessor :list, :file

  def initialize(file:)
    self.file = file
  end

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

  def get_fromID(id)
    self.list.each {|stud| if stud.ID == id then return stud end}
    raise ArgumentError("ID студента не найдено, либо формат ввода неверный")
  end


  def get_k_n_student_short_list(k:, n:, data_list: nil)
    accum_list = self.list[((k-1)*n)..(k*n)]
    short_student_list = accum_list.map {|stud| Student_short.from_student(stud)}
    if data_list.nil?
      return Data_List_Student_Short.new(objects: short_student_list)
    else
      return data_list.list.append(*short_student_list)
    end

  end

  def sort_by_shortname
    self.list.sort_by{|obj| obj.get_short}
  end


  def add_student(student:)
    student.ID = get_id
    self.list.append(student)
  end

  def change_byID(student, id)
    self.list.each_with_index do |stud, index|
      if (stud.ID = id)
        self.list[index] = student
      end
    end
  end

  def delete_byID(id)
    self.list.each_with_index do |stud, index|
      if (stud.ID = id)
        self.list.delete_at(index)
      end
    end
  end

  def get_student_short_count
    self.list.count
  end

  private
  def get_id
    before_ids = self.list.map {|student| return student.ID}
    id = 0
    while id in before_ids
      id+=1
    end
    id
  end

end