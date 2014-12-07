class DashboardController < ApplicationController
  def home
    @events = Event.where(authorized: nil)
  end
end
