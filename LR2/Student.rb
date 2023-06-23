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

  def self.phone_valid?(phone)
    if phone.match(/^\+?[7,8]{1}\-\d{3}\-\d{3}\-\d{2}\-\d{2}$/)
      "Match"
    else
      "No"
    end
  end

  def to_s
    inf=@Name.to_s+" "+@Surname.to_s+" "+@Father_name.to_s+" "+@ID.to_s
    inf
  end
end