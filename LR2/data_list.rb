class Data_List

  private
  def initialize(objects:)
    self.list = objects
    self.selected_id = []
  end

  def select(number)
    @Selected_id.append(@List[number])
    return nil
  end

  def get_selected
    return @Selected_id unless @Selected_id.empty?
    []
  end

  def get_names
    ["№", *get_obj_attr_names]
  end

  def get_obj_attr_names()
  end

  protected
  def list
    @list
  end

  def list=(list)
    @list = list
  end

  private
  def selected_id
    @selected_id
  end

  def selected_id=(selected_id)
    @selected_id = selected_id
  end

  def get_obj_attr(obj)
  end

  def get_data #в наследниках
  end

end

