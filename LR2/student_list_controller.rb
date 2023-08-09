require "window"
require_relative 'Basic_list'

class StudentListController
  attr_accessor :view, :student_list

  def initialize(view)
    # Спроси зачем
    self.view = view
    self.list = Basic_list.new
  end

end