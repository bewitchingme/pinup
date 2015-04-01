class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_dashboard_path
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end
end