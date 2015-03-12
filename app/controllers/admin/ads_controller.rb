class Admin::AdsController < ApplicationController
  
  expose(:ads) { Admin::Ad.all }
  expose(:ad, attributes: :ad_params) { params[:id].nil? ? Admin::Ad.new : Admin::Ad.find(params[:id]) }

  respond_to :html

  before_action :authenticate_user!

  def create
    self.ad = Admin::Ad.new(ad_params)
    if ad.save
      redirect_to admin_dashboard_path, notice: 'Ad successfully created'
    else
      redirect_to admin_dashboard_path, alert: 'Problem while creating ad'
    end
  end

  def update
    ad.update(ad_params)
    redirect_to admin_dashboard_path, notice: 'Ad successfully updated'
  end

  def destroy
    ad.destroy
    redirect_to admin_dashboard_path, notice: 'Ad successfully destroyed'
  end

  def destroy_all
    Admin::Ad.destroy_all
    redirect_to admin_dashboard_path, notice: 'Ads successfully destroyed'
  end

  private
    
    def ad_params
      params.require(:admin_ad).permit(:image, :url)
    end

end
