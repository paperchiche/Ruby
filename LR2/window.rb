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

    self.window = MainWindow.new(app)

    self.set_table_handlers
    self.set_lcr_handlers
    self.set_tab_book_handler

    app.create

    self.controller = StudentListController.new(self)

    self.window.del_button.connect(SEL_COMMAND) do
      self.controller.del_selected
      self.refresh
    end

    self.refresh

    app.run

  end

def set_table_handlers
  table = self.window.table
  chg_button = self.window.chg_button
  del_button = self.window.del_button

  cells_selected_handler = Proc.new do
    all_cols_selected = table.selEndColumn - table.selStartColumn + 1 == table.numColumns
    num_selected_rows = table.selEndRow - table.selStartRow + 1

    self.controller.unselect

    (table.selStartRow..table.selEndRow).each do |row|
      self.controller.select(row)
    end

    if num_selected_rows == 1 and all_cols_selected
      chg_button.enable
      del_button.enable
    elsif num_selected_rows > 1 and all_cols_selected
      chg_button.disable
      del_button.enable
    else
      chg_button.disable
      del_button.disable
    end
  end

  table.connect(SEL_SELECTED, &cells_selected_handler)
  table.connect(SEL_CHANGED, &cells_selected_handler)

  table.columnHeader.connect(SEL_COMMAND) do |_, _, index|
    if(index == 1)
      puts("Сортировка")
      self.sort
    else
      puts("Сортировочки пока нет...")
    end
  end
end

attr_accessor :window

private
attr_accessor :controller

def set_tab_book_handler
  window.tabBook.connect(SEL_COMMAND) do |sender, selector, data|
    if(sender.current == 0) then
      self.refresh(reload: true)
    end
  end
end

def sort
  self.controller.sort
  self.refresh
end

def set_lcr_handlers
  self.window.go_left_button.connect(SEL_COMMAND) do
    self.controller.prev_page
    self.refresh
  end

  self.window.go_right_button.connect(SEL_COMMAND) do
    self.controller.next_page
    self.refresh
  end
end


def erase_table
  for i in 0...self.window.table.numRows
    for j in 0...self.window.table.numColumns
      self.window.table.setItemText(i, j, "")
    end
  end
end

def refresh(reload: false)
  self.controller.refresh_data(reload: reload)

  self.window.page_count_label.text = self.controller.page_count.to_s
  self.window.cur_page_label.text = self.controller.cur_page.to_s
end