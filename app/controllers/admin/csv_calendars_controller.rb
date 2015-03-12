require 'csv'
require "open-uri"

class Admin::CsvCalendarsController < ApplicationController

  expose(:csv_calendar, attributes: :csv_calendar_params) { params[:id].nil? ? Admin::CsvCalendar.new : Admin::CsvCalendar.find(params[:id]) }
  expose(:csv_calendars) { Admin::CsvCalendar.all }

  before_action :authenticate_user!

  respond_to :html

  def create
    if params[:admin_csv_calendar].nil?
      redirect_to admin_dashboard_path
    else
      self.csv_calendar = Admin::CsvCalendar.new(csv_calendar_params)
      if csv_calendar.save
        import_events_from_calendar
        redirect_to admin_dashboard_path
      else
        redirect_to admin_dashboard_path
      end
    end
  end

  def update
    csv_calendar.update(csv_calendar_params)
    redirect_to admin_dashboard_path
  end

  def destroy
    csv_calendar.destroy
    redirect_to admin_dashboard_path
  end

  private

    def csv_calendar_params
      params.require(:admin_csv_calendar).permit(:file)
    end

    def import_events_from_calendar
      CsvCalendarLoader.perform_async(csv_calendar.id)
    end
end
