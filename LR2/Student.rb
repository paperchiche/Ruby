require_relative 'student_short'
require_relative 'Super_Student'

class Student<Super_Student
  attr_reader :ID, :Name, :Surname, :Father_name, :Git, :Phone, :Tg, :Mail, :Git
  def initialize(name:, surname:, father_name:, id:nil, git:nil, phone:nil, tg:nil, mail:nil)
    super(name, surname, father_name, other["id"], other["git"])
    self.Phone=other["phone"]
    self.Mail=other["mail"]
    self.Tg=other["tg"]
  end

  def self.phone_valid?(phone)
    phone.match(/^\+?[7,8]{1}\-\d{3}\-\d{3}\-\d{2}\-\d{2}$/)
  end

  def Phone=(phone)
    raise ArgumentError("Invalid value, phone number's correct form is \"+7(8)-XXX-XXX-XX-XX\"") if !phone.nil? && !Student.phone_valid?(phone)
    @Phone = phone
  end

  def Tg=(tg)
    raise ArgumentError, "Invalid value, Telegram account's correct form is @X where X is english alphabet sequence" if !tg.nil? && !Student.acc_valid?(tg)
    @Tg = tg
  end

  def self.mail_valid?(mail)
    mail.match(/^[\w\d]+@[\w]+\.[\w]+$/)
  end


  def Mail=(mail)
    raise ArgumentError, "Invalid value, Mail's correct form is X@X.X where X is english alphabet sequence" if !mail.nil? && !Student.mail_valid?(mail)
    @Mail = mail
  end

  def contacts?
    !self.Phone.nil? || !self.Tg.nil? || !self.Mail.nil?
  end

  def validate
    self.git? && self.contacts?
  end

  def set_contacts(mail:nil, tg:nil, phone:nil)
    if self.contact != ""
      self.Phone = phone unless phone.nil?
      self.Mail = mail unless mail.nil?
      self.Tg = tg unless tg.nil?
    end
  end


  def to_s
    info=@Name.to_s+" "+@Surname.to_s+" "+@Father_name.to_s+" "
    info+=tg_to_s
    info+=phone_to_s
    info
  end


public
def getInfo
  short=Student_short.from_student(self)
  "#{short_name}, #{contact}, #{git_to_s}"
end


def contact
  s=""
  s+= self.phone_to_s
  s+= self.tg_to_s
  s+= self.mail_to_s
  return s
end

  def validate?
    git? && self.contact!=""
  end

  def git?
    !@Git.nil?
  end

def self.parse_str(str)
  str_student=str.split(', ').map{|x| x.split(':')}.to_h
  raise ArgumentError,"Invalid name " unless str_student.key?("name") && Student.name_valid?(str_student["name"])
  raise ArgumentError,"Invalid surname" unless str_student.key?("surname") && Student.name_valid?(str_student["surname"])
  raise ArgumentError,"Invalid father's name" unless str_student.key?(:"father_name") && Student.name_valid?(str_student[:"father_name"])
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
