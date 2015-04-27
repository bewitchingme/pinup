class EventsController < ApplicationController
  protect_from_forgery except: :index

  before_action :authenticate_user!, only: [ :edit, :update, :destroy ]

  expose(:types) { EventType.order('name ASC') }
  expose(:events) { params[:filter].nil? ? find_all_events : find_filtered_events }
  expose(:event, attributes: :event_params) { params[:id].nil? ? Event.new : Event.find(params[:id]) }
  expose(:date) { params[:date].nil? ? Date.today : Date.parse(params[:date]) }

  def create
    self.event = Event.new(event_params)

    respond_to do |format|
      if event.save
        format.html { redirect_to event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: event }
      else
        format.html { render :new }
        format.json { render json: event.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
      Event.import(params[:file])
      redirect_to admin_dashboard_path, notice: "Events from CSV Imported"
  end

  def update
    respond_to do |format|
      if event.update_attributes!(event_params)
        format.html { redirect_to admin_dashboard_path, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: event }
      else
        format.html { render :edit }
        format.json { render json: event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    event.destroy

    respond_to do |format|
      format.html { redirect_to admin_dashboard_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def event_params
      params.require(:event).permit(:description, :price, :referrer, :authorized, :source, :title, :organization, :start_time, :url, :duplicate_of, :end_time, :rrule, :venue_details, :venue_id, :artist_id, :event_type_id)
    end

    def find_all_events
      Event.where(
        'start_time > ? AND authorized = ?', Time.now, true
      ).order( 'start_time ASC' ).page( params[:page] )
    end

    def find_filtered_events
      Event.where(
        'start_time >= ? AND event_type_id = ? AND authorized = ?',
        Date.today, EventType.find_by( name: params[:filter] ), true
      ).order( 'start_time ASC' ).page( params[:page] )
    end
end
