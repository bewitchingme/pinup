require 'csv'
require "open-uri"

class CsvCalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_csv_calendar, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @csv_calendars = CsvCalendar.all
    respond_with(@csv_calendars)
  end

  def show
    respond_with(@csv_calendar)
  end

  def new
    @csv_calendar = CsvCalendar.new
    respond_with(@csv_calendar)
  end

  def edit
  end

  def create
    if params[:csv_calendar].nil?
      redirect_to dashboard_path
    else
      @csv_calendar = CsvCalendar.new(csv_calendar_params)
      if @csv_calendar.save
        import_events_from_calendar(open(@csv_calendar.file.path))
        redirect_to dashboard_path
      else
        redirect_to dashboard_path
      end
    end
  end

  def update
    @csv_calendar.update(csv_calendar_params)
    respond_with(@csv_calendar)
  end

  def destroy
    @csv_calendar.destroy
    respond_with(@csv_calendar)
  end

  private
    def set_csv_calendar
      @csv_calendar = CsvCalendar.find(params[:id])
    end

    def csv_calendar_params
      params.require(:csv_calendar).permit(:file)
    end

    def import_events_from_calendar(file)
      raise "No input CSV file specified" if file.nil?
      Rails.logger.info "Importing events..."
      CSV.foreach(file, { headers: :first_row }) do |col|
        event = Event.create!(
          name:         col[1],
          venue:        col[2],
          description:  col[5],
          begin_at:     ( Date.parse(col[0]) + Time.parse(col[3]).seconds_since_midnight.seconds ).to_datetime,
          price:        col[4].to_i,
          referrer:     Referrer.find_or_create_by( name: col[7], url: col[6] )
        )
        Rails.logger.info "Created event:\n\tname:\t\t#{event.name}\n\tvenue:\t\t#{event.venue}\n\tdescription:\t#{event.description}\n\tbegin_at:\t#{event.begin_at}\n\tprice:\t\t#{event.price}\n\turl:\t\t#{event.referrer.url}\n\treferrer:\t#{event.referrer}\n\n"
      end
    end
end
