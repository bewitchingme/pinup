class AdsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ad, only: [ :show, :edit, :update, :destroy ]

  def index
    @ads = Ad.all
  end

  def show
  end

  def new
    @ad = Ad.new
  end

  def edit
  end

  def create
    if params[:image].nil?
      redirect_to dashboard_path, alert: 'Ad empty'
    else
      @ad = Ad.new(ad_params)
      if @ad.save
        redirect_to dashboard_path, notice: 'Ad successfully created'
      else
        redirect_to dashboard_path, alert: 'Problem while creating ad'
      end
    end
  end

  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:image)
    end
end
