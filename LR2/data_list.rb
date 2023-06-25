class Data_List

  private
  attr_writer :List
  attr_accessor :Selected_id

  def initialize(objects)
    @List = objects
    @Selected_id = []
  end

  def select(number)
    @Selected_id.append(@List[number])
    return nil
  end

  def get_selected
    return @Selected_id unless @Selected_id.empty?
    []
  end

  def get_names #в наследниках
  end

  def get_data #в наследниках
  end

end

