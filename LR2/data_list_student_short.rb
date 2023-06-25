require_relative 'data_list'

class Data_List_Student_Short<Data_List
  def initialize(objects)
    super(objects:objects)

  end

  def get_names
    return ["short_fio", "git", "contact"]
  end

  def get_data
    table = []
    counter = 0
    @List.each { |obj| table.append([counter, obj.short_name, obj.git, obj.contact]); counter += 1}
    return Data_table.new(table: table)
  end

end