class Admin::BannersController < ApplicationController

  expose(:banners) { Admin::Banner.all }
  expose(:banner, attributes: :banner_params) { params[:id].nil? ? Admin::Banner.new : Admin::Banner.find(params[:id]) }

  respond_to :html

  def create
    self.banner = Admin::Banner.new(banner_params)
    if banner.save
      redirect_to admin_dashboard_path, notice: 'Banner successfully created'
    else
      redirect_to admin_dashboard_path, alert: 'Problem while creating banner'
    end
  end

  def update
    banner.update(banner_params)
    redirect_to admin_dashboard_path
  end

  def destroy
    banner.destroy
    redirect_to admin_dashboard_path
  end

  def destroy_all
    Admin::Banner.destroy_all
    redirect_to admin_dashboard_path
  end

  private

    def banner_params
      params.require(:admin_banner).permit(:image, :url)
    end

end
