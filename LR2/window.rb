require_relative "main_window"
require_relative "student_list_controller"

class Student_List_View
  def set_table_params(column_names, whole_entities_count)
    self.window.table.setTableSize(whole_entities_count, 4)
    self.window.set_table_headers(column_names)
  end

  def set_table_data(data_table)
    table = self.window.table
  end



  self.erase_table

  (0...data_table.get_rows_number).each do |x|
    if data_table.get_element(row:x, col:0).nil? then break end

    (0...data_table.get_cols_number).each do |y|
      value = data_table.get_element(row:x, col:y)
      table.setItemText(x, y, value.to_s)
      end
    end
end

  def initialize

    app = FXApp.new

    self.window = StudentMainWindow.new(app)

    self.set_table_handlers
    self.set_lcr_handlers
    self.set_tab_book_handler

    app.create

    self.controller = StudentListController.new(self)
    self.refresh

    app.run

  end