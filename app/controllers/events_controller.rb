class EventsController < ApplicationController
  protect_from_forgery except: :index

  expose(:types) { EventType.all }
  
  expose(:events) do
    unless filter_param.nil?
      Event.where(
        'begin_at = ? AND event_type_id = ?', Time.now, EventType.find_by(name: filter_param)
        ).order('begin_at ASC').page(page_param)
    else
      Event.where('begin_at > ?', Time.now).order('begin_at ASC').page(page_param)
    end
  end

  expose(:event, attributes: :event_params) do
    unless id_param.nil?
      Event.find(id_param)
    else
      Event.new
    end
  end

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
        format.html { redirect_to event, notice: 'Event was successfully updated.' }
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
      params.require(:event).permit(:name, :description, :begin_at, :price, :referrer, :artist, :venue, :type)
    end

    def id_param
      params[:id]
    end

    def page_param
      params[:page]
    end

    def filter_param
      params[:filter]
    end
end
