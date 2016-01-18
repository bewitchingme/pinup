require 'nokogiri'
require 'digest/sha1'
require 'open-uri'

class Admin::DashboardController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  before_action :authenticate_user!

  expose(:banner) { Admin::Banner.new }
  expose(:ad) { Admin::Ad.new }
  expose(:csv_calendar) { Admin::CsvCalendar.new }
  expose(:csv_calendars) { Admin::CsvCalendar.all }
  
  def home
    @events = Event.order(start_time: :desc)
    @events_authorization = Event.where(authorized: false).order(start_time: :desc)
    @artists = Artist.all
    @venues = Venue.order('authorized ASC, title ASC').all
  end

  private

    def authorize_all_events
      Event.authorize_all
    end

end
