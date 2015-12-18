class Admin::ExternalCalendarsController < ApplicationController
  
  expose(:external_calendars) { Admin::ExternalCalendar.all }
  expose(:external_calendar, attributes: :external_calendar_params) { params[:id].nil? ? Admin::ExternalCalendar.new : Admin::ExternalCalendar.find(params[:id]) }

  respond_to :html

  def index
    respond_with(external_calendars)
  end

  def show
    respond_with(external_calendar)
  end

  def new
    respond_with(external_calendar)
  end

  def edit
  end

  def create
    self.external_calendar = Admin::ExternalCalendar.new(external_calendar_params)
    external_calendar.save
    respond_with(external_calendar)
  end

  def update
    external_calendar.update(external_calendar_params)
    respond_with(external_calendar)
  end

  def destroy
    external_calendar.destroy
    respond_with(external_calendar)
  end

  private

    def external_calendar_params
      params.require(:admin_external_calendar).permit(:title, :url)
    end

end
