module ApplicationHelper
  include Pagy::Frontend

  def login?
    current_user.present?
  end
end
