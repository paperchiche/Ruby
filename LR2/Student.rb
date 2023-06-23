class Student
  def initialize(id, surname, name, father_name, phone, tg, mail, git)
    @ID, @Surname, @Name, @Father_name, @Phone, @Tg, @Mail, @Git = id, surname, name, father_name, phone, tg, mail, git
  end
  def ID #геттер
    @ID
  end
  def ID=(id) #сеттер
    @ID = id
  end
  def Surname
    @Surname
  end
  def Surname=(surname)
    @Surname=surname
  end
  def Name
    @Name
  end
  def Name=(name)
    @Name=name
  end
  def Father_name
    @Father_name
  end
  def Father_name=(father_name)
    @Father_name=father_namename
  end
  def Phone
    @Phone
  end
  def Phone=(phone)
    @Phone=phone
  end
  def Tg
    @Tg
  end
  def Tg=(tg)
    @Tg=tg
  end
  def mail
    @Mail
  end
  def Mail=(mail)
    @Mail=mail
  end
  def Git
    @Git
  end
  def Git=(git)
    @Git=git
  end
end