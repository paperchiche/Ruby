class Student
  attr_accessor :ID, :Name, :Surname, :Father_name, :Git, :Phone, :Tg, :Mail, :Git
  def initialize(name:, surname:, father_name:, id:nil, git:nil, phone:nil, tg:nil, mail:nil)
    self.Name, self.Surname, self.Father_name = name, surname, father_name
    self.ID = id
    self.Git = git
    self.Phone = phone
    self.Mail = mail
    self.Tg = tg
  end

  def to_s
    inf=@Name.to_s+" "+@Surname.to_s+" "+@Father_name.to_s
    inf=@Name.to_s+" "+@Surname.to_s+" "+@Father_name.to_s+" "+@ID.to_s
    inf
  end
end