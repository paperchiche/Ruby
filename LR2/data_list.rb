require_relative 'data_table'
class Data_list
  private
  attr_accessor :selected, :arary
  public
  attr_accessor :list

  def initialize(list:)
    self.list = list
    self.arary = []
  end

  def unselect
    self.arary = []
  end

  def select(*number)
    self.arary.append(self.list[number].ID)
  end
  def get_select
    self.arary
  end
  def clear_selected
    self.selected_data = []
  end

  def get_names
    return ["№", *get_objects_attr_names]
  end

  def get_information(obj)
    raise NotImplementedError, "This method is implemented in subclasses"
  end

  def get_data
    table = []
    counter = 0
    list.each { |obj| table.append([counter, *get_objects_attr(obj)]); counter += 1}
    return Data_table.new(table: table)
  end

  def get_objects_attr(obj)
    return []
  end
  def get_objects_attr_names()
    return []
  end

  private
  attr_accessor :data_list, :selected_data

end