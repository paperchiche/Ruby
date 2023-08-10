require_relative 'data_list'
require_relative 'data_table'

class Data_list_student_short < Data_list
  public_class_method :new

  attr_accessor :view

  def notify
    self.view.set_table_params(self.get_objects_attr_names.map{|x| x.to_s}, self.list.size)
    self.view.set_table_data(self.get_data)
  end

  def initialize(data)
    super
  end

  def get_names
    %w[surname_initials git contact]
  end

  def get_information(obj)
    [obj.surname_initials, obj.git, obj.contact]
  end

  private
  def format_data(data)
    super(data).map { |datum| datum.join(', ') }
  end

  def format_names(names)
    super(names).map { |name| name.capitalize }
  end

end