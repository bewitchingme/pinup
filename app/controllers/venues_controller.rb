class VenuesController < ApplicationController
  
  expose(:venues) { Venue.order('name ASC') }

  expose(:venue, attributes: :venue_params) do 
    unless params[:id].nil?
      Venue.find(params[:id])
    else
      Venue.new
    end
  end

  def create
    self.venue = Venue.new(venue_params)

    respond_to do |format|
      if venue.save
        format.html { redirect_to venue, notice: 'Venue was successfully created.' }
        format.json { render :show, status: :created, location: venue }
      else
        format.html { render :new }
        format.json { render json: venue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if venue.update(venue_params)
        format.html { redirect_to venue, notice: 'Venue was successfully updated.' }
        format.json { render :show, status: :ok, location: venue }
      else
        format.html { render :edit }
        format.json { render json: venue.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def venue_params
      params.require(:venue).permit(:name, :address, :city)
    end
end
