class Admin::EventsController < EventsController
  def authorize_all
    Event.authorize_all
    redirect_to admin_dashboard_path
  end

  def authorize
    event.authorize
    redirect_to admin_dashboard_path
  end

  def unauthorize
    event.unauthorize
    redirect_to admin_dashboard_path
  end
end