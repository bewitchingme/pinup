class RootController < ApplicationController
  def home
    if user_signed_in? and current_user.admin?
      redirect_to dashboard_path
    else
      redirect_to events_path
    end
  end
end
