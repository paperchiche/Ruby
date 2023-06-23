class Student
  attr_accessor :ID, :Name, :Surname, :Father_name, :Git, :Phone, :Tg, :Mail, :Git
  def to_s
    inf=@Name.to_s+" "+@Surname.to_s+" "+@Father_name.to_s
    inf
  end