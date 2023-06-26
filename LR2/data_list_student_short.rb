require_relative 'data_list'

class Data_List_Student_Short<Data_List
  private
  def get_obj_attr(obj)
    return [obj.to_s]

  end

  def get_obj_attr_names
    return ["short_name", "git", "contact"]
  end

end