class Admin::AdsController < ApplicationController
  before_action :set_admin_ad, only: [:show, :edit, :update, :destroy]

  # GET /admin/ads
  # GET /admin/ads.json
  def index
    @admin_ads = Admin::Ad.all
  end

  # GET /admin/ads/1
  # GET /admin/ads/1.json
  def show
  end

  # GET /admin/ads/new
  def new
    @admin_ad = Admin::Ad.new
  end

  # GET /admin/ads/1/edit
  def edit
  end

  # POST /admin/ads
  # POST /admin/ads.json
  def create
    @admin_ad = Admin::Ad.new(admin_ad_params)

    respond_to do |format|
      if @admin_ad.save
        format.html { redirect_to @admin_ad, notice: 'Ad was successfully created.' }
        format.json { render :show, status: :created, location: @admin_ad }
      else
        format.html { render :new }
        format.json { render json: @admin_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/ads/1
  # PATCH/PUT /admin/ads/1.json
  def update
    respond_to do |format|
      if @admin_ad.update(admin_ad_params)
        format.html { redirect_to @admin_ad, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_ad }
      else
        format.html { render :edit }
        format.json { render json: @admin_ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/ads/1
  # DELETE /admin/ads/1.json
  def destroy
    @admin_ad.destroy
    respond_to do |format|
      format.html { redirect_to admin_ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_ad
      @admin_ad = Admin::Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_ad_params
      params[:admin_ad]
    end
end
