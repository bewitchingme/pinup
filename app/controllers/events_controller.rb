class EventsController < ApplicationController
  expose(:events) { Event.where('date_begin > ?', Time.now).order('date_begin ASC') }
  expose(:event, attributes: :event_params) do
    unless params[:id].nil?
      Event.find(params[:id])
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
      params.require(:event).permit(:title, :content, :date_begin, :date_end, :location, :cover, :price, :url, :referrer)
    end
end
