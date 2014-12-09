class DashboardController < ApplicationController
  before_action :authenticate_user!
  def home
    @events = Event.where(authorized: nil)
    @csv_calendar = CsvCalendar.new
    @csv_calendars = CsvCalendar.all
  end
end
