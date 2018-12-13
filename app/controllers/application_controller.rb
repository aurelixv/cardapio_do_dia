class ApplicationController < ActionController::Base
  def is_signed_in
    user_signed_in? ? true : (redirect_to root_path)
  end

  def is_admin
    (is_signed_in and current_user.admin.present?) ? true : (redirect_to root_path)
  end
end
