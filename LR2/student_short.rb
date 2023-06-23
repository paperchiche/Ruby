class Student_short
  attr_reader :ID, :Initials,:Git,:Contact
  def initialize(id:, name:, git:, contact:)
    @ID = id
    @Initials = name
    @Git = git
    @Contact = contact
  end

  def self.from_student(student)
    st_sh = student.getInfo.split(', ').map{|x| x.split(': ')}.map{|x| [x[0].to_sym,x[1]]}.to_h
    new(id:student.ID,name:st_sh[:name],git:st_sh[:git],contact:st_sh.reject{|key,value| key==:name||key==:git}.shift)
  end
  def self.from_s(id, str)
    st_str = str.split(',').map{|x| x.split(':')}.map{|x| [x[0].to_sym,x[1]]}.to_h
    new id:id,name:st_str[:name],git:st_str[:git],contact:st_str[:contact]
  end
end
