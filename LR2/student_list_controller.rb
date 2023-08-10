require "window"
require_relative 'Basic_list'

class StudentListController
  private
  attr_accessor :view, :student_list, :data_list_student_short

  public
  def initialize(view)

    self.view = view
    self.student_list = Basic_list.new
    self.student_list.format = Student_list_DB.new
    self.load_list
    self.data_list_student_short = self.list.get_k_n_student_short_list(k:0, n:self.table_row_count)
    self.data_list_student_short.view = self.view
  end

end