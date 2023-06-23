class Student_short
  attr_reader :ID, :Surname, :Initials,:Git,:Contact
  def initialize(student)
    @ID = student.ID
    @Surname = student.Surname
    @Initials = "#{student.Name[0]}. #{student.Father_name[0]}."
    @Git = student.Git unless student.Git.nil?
    @Contact = student.contact
  end

  def self.from_s(str)
    Student_short.new(Student.parse_str(str))
  end

  def short_name
    "#{@Surname} #{@Initials}"
  end

  def to_s
    result = short_name
    result += " id=#{@ID} " unless @ID.nil?
    result += @Contact unless @Contact.nil?
    result
  end

  def git?
    !@Git.nil?
  end

  def contact?
    !@Contact.nil?
  end

  def validate?
    git? && contact?
  end

end
