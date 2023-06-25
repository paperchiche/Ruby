require_relative 'student_short'

class Student<Super_Student
  attr_reader :ID, :Name, :Surname, :Father_name, :Git, :Phone, :Tg, :Mail, :Git
  def initialize(name:, surname:, father_name:, id:nil, git:nil, phone:nil, tg:nil, mail:nil)
    self.Name, self.Surname, self.Father_name = name, surname, father_name
    self.ID = id
    self.Git = git
    set_contacts(mail:mail, tg:tg, phone:phone)
  end

  def self.phone_valid?(phone)
    phone.match(/^\+?[7,8]{1}\-\d{3}\-\d{3}\-\d{2}\-\d{2}$/)
  end

  def Phone=(phone)
    raise ArgumentError("Invalid value, phone number's correct form is \"+7(8)-XXX-XXX-XX-XX\"") if !phone.nil? && !Student.phone_valid?(phone)
    @Phone = phone
  end

  def self.acc_valid?(account)
    account.match(/^@[\w\d\-_]+$/)
  end

  def Tg=(tg)
    raise ArgumentError, "Invalid value, Telegram account's correct form is @X where X is english alphabet sequence" if !tg.nil? && !Student.acc_valid?(tg)
    @Tg = tg
  end

  def Git=(git)
    raise ArgumentError, "Invalid value, Git's correct form is @X where X is english alphabet sequence" if !git.nil? && !Student.acc_valid?(git)
    @Git = git
  end

  def self.mail_valid?(mail)
    mail.match(/^[\w\d]+@[\w]+\.[\w]+$/)
  end


  def Mail=(mail)
    raise ArgumentError, "Invalid value, Mail's correct form is X@X.X where X is english alphabet sequence" if !mail.nil? && !Student.mail_valid?(mail)
    @Mail = mail
  end

  def git?
    !self.Git.nil?
  end

  def contacts?
    !self.Phone.nil? || !self.Tg.nil? || !self.Mail.nil?
  end

  def validate
    self.git? && self.contacts?
  end

  def set_contacts(mail:nil, tg:nil, phone:nil)
    self.Phone = phone if phone
    self.Mail = mail if mail
    self.Tg = tg if tg
  end


  def to_s
    inf=@Name.to_s+" "+@Surname.to_s+" "+@Father_name.to_s+" "
    inf+=@Tg.to_s unless @Tg.nil?
    inf
  end


public
def getInfo
  short=Student_short.from_student(self)
  "#{short_name}, #{contact}, #{git_to_s}"
end


def contact
  s=""
  s+= ", phone: #{@Phone}" unless @Phone.nil?
  s+= ", telegram: #{@Tg}" unless @Tg.nil?
  s+= ", mail: #{@Mail}" unless @Mail.nil?
  return s
end

def self.parse_str(str)
  str_student=str.split(', ').map{|x| x.split(':')}.to_h
  raise ArgumentError,"Invalid name" unless str_student.key?("name") && Student.name_valid?(str_student["name"])
  raise ArgumentError,"Invalid surname" unless str_student.key?("surname") && Student.name_valid?(str_student["surname"])
  raise ArgumentError,"Invalid father's name" unless str_student.key?("father_name") && Student.name_valid?(str_student["father_name"])
  if str_student.key?("tg")
    raise ArgumentError, "Invalid telegram" unless Student.acc_valid?(str_student["tg"])
  end
  if str_student.key?("git")
    raise ArgumentError, "Invalid git" unless Student.acc_valid?(str_student["git"])
  end
  if str_student.key?("mail")
    raise ArgumentError, "Invalid mail addres" unless Student.mail_valid?(str_student["mail"])
  end
  if str_student.key?("id")
    raise ArgumentError, "Invalid id" unless Student.id_valid?(str_student["id"])
  end
  if str_student.key?("phone")
    raise ArgumentError, "Invalid phone number" unless Student.phone_valid?(str_student["phone"])
  end
  Student.new(name:str_student["name"],surname:str_student["surname"],father_name:str_student["father_name"], mail:str_student["mail"], git:str_student["git"], tg:str_student["tg"])

end

protected
  def git_to_s
    return "" if git?
    ", git: #{@Git}"
  end

  def mail_to_s
    return "" if self.Mail.nil?
    ", email: #{@Mail}"
  end
  def tg_to_s
    return "" if self.Tg.nil?
    ", telegram: #{@Tg}"
  end

  def phone_to_s
  return "" if self.Phone.nil?
  ", phone: #{@Phone}"
  end

end
