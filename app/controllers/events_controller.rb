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

  def update
    respond_to do |format|
      if event.update_attributes(event_params)
        format.html { redirect_to request.referrer, notice: 'Event was successfully updated.' }
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
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :begin_at, :price, :referrer, :artist, :venue, :type, :authorized)
    end

    def find_all_events
      Event.where(
        'begin_at > ?', Time.now
      ).authorized.order( 'begin_at ASC' ).page( params[:page] )
    end

    def find_filtered_events
      Event.where(
        'begin_at >= ? AND event_type_id = ?',
        Date.today, EventType.find_by( name: params[:filter] )
      ).authorized.order( 'begin_at ASC' ).page( params[:page] )
    end
end
