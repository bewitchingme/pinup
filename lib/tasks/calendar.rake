require 'nokogiri'
require 'digest/sha1'

include ActionView::Helpers::SanitizeHelper

namespace :calendar do

  desc "generates events from calendars xml"
  task :load, [ :url ] => :environment do |t, args|
    Digger::Calendar.load
  end
end