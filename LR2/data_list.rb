class Data_list

  def initialize(data)
    self.data_list = data
    self.selected_data = []
  end
  def select(*numbers)
    selected_data.append(*numbers)
  end
  def get_select
    selected_data.inject([]) {|res, index| res<<data_list[index].id}
  end
  def clear_selected
    self.selected_data = []
  end

  # применение паттерна Шаблон
  def get_names
    raise NotImplementedError, "This method is implemented in subclasses"
  end

  def get_information(obj)
    raise NotImplementedError, "This method is implemented in subclasses"
  end

  def get_data
    student_data = []
    self.data_list.map.with_index do |student, i|
      student_data.append([i].append(self.get_information(student)))
    end
    Data_table.new(student_data)
  end

  private
  attr_accessor :data_list, :selected_data

end