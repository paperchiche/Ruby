class Super_Student

  attr_accessor :Name, :Surname, :Father_name, :ID

  def initialize(name, surname, father_name, id)
    @Name = name
    @Surname = surname
    @Father_name = father_name
    @ID = id
  end

  def self.id_valid?(id)
    String(id).match(/^\d+$/)
  end

  def ID=(id)
    raise ArgumentError("Invalid value, id is digit sequence") if !id.nil? && !Super_Student.id_valid?(id)
    @ID = id
  end

  def self.name_valid?(name)
    name.match(/^[А-Яа-я]+$/)
  end

  def Name=(name)
    raise ArgumentError("Invalid value, Name is russian alphabet sequence") if !name.nil? && !Super_Student.name_valid?(name)
    @Name = name
  end

  def Surname=(surname)
    raise ArgumentError("Invalid value, Surname is russian alphabet sequence") if !surname.nil? && !Super_Student.name_valid?(surname)
    @Surname = surname
  end

  def Father_name=(father_name)
    raise ArgumentError("Invalid value, Father name is russian alphabet sequence") if !father_name.nil? && !Super_Student.name_valid?(father_name)
    @Father_name = father_name
  end

  def short_fio
    "#{Surname} #{Name.upcase[0]}. #{Father_name.upcase[0]}"
  end

  def self.parse_str
  end

  def getInfo
  end

  def contacts
  end

end