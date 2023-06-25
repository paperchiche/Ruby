require_relative 'data_list'

class Data_List_Student_Short<Data_List
  attr_accessor :data_list

  def get_names
    return ["short_fio", "git", "contact"]
  end

  def get_data
    table = []
    counter = 0
    list.each { |obj| table.append([counter, obj.short_fio, obj.git, obj.contact]); counter += 1}
    return data_table.new(table: table)
  end

end