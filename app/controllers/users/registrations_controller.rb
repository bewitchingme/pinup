class Users::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end