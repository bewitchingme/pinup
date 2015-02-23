require 'nokogiri'
require 'digest/sha1'
require 'open-uri'

class DashboardController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  before_action :authenticate_user!

  expose(:lists) { List.all }
  
  def home
    @events = Event.all.order(begin_at: :desc)
    @events_authorization = Event.where(authorized: nil).order(begin_at: :desc)
    @csv_calendar = CsvCalendar.new
    @csv_calendars = CsvCalendar.all
    @ad = Ad.new
    @banner = Banner.new
  end

  def load_google_calendars
    load_cals
    redirect_to dashboard_path
  end

  def authorize_all
    authorize_all_events
    redirect_to dashboard_path
  end

  def delete_all_ads
    Ad.delete_all
    redirect_to dashboard_path
  end

  def delete_all_banners
    Banner.delete_all
    redirect_to dashboard_path
  end

  private

    def authorize_all_events
      Event.where(authorized: nil).each do |event|
        event.update_columns authorized: true
      end
    end

    def load_cals
      Digger::Calendar.load
    end
end
