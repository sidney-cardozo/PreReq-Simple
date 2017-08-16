module ApplicationHelper
  def is_owner(table, component_id, current_user)
    return table.find(component_id).user_id == current_user.id
  end

end
