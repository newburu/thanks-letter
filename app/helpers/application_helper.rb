module ApplicationHelper
  def login?
    current_user.present?
  end
end
