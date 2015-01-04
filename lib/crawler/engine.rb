require 'nokogiri'
require 'thread'

module Crawler

  class Engine
    include Singleton
    attr_accessor :google_calendars, :facebook_events, :custom_websites

    IDLE_TIME = 5.minutes

    class << self
      def start
        puts 'Crawler started.'
        Engine.instance.start
      end

      def stop
        puts 'Crawler stopped.'
        Engine.instance.stop
      end
    end

    def initialize
      @running_mutex = Mutex.new
      @calendars_mutex = Mutex.new
      @events_mutex = Mutex.new
      @websites_mutex = Mutex.new
      
      self.google_calendars = []
      self.facebook_events = []
      self.custom_websites = []
    end

    def start
      Thread.new do

        puts "Starting..."

        @running_mutex.synchronize { @running = true }

        while(@running) do
          @calendars_mutex.synchronize do
            fetch_google_calendars
            parse_google_calendars
          end
          
          @events_mutex.synchronize do
            fetch_facebook_events
            parse_facebook_events
          end

          @websites_mutex.synchronize do
            fetch_custom_websites
            parse_custom_websites
          end

          sleep IDLE_TIME
        end

        puts "Stopping..."

      end
    end

    def stop
      @running_mutex.synchronize { @running = false }
    end

    private
      def fetch_google_calendars
        puts "fetching google calendars..."
      end

      def parse_google_calendars
        puts "parsing google calendars..."
      end

      def fetch_facebook_events
        puts "fetching facebook events..."
      end

      def parse_facebook_events
        puts "parsing facebook events..."
      end

      def fetch_custom_websites
        puts "fetching custom websites..."
      end

      def parse_custom_websites
        puts "parsing custom websites..."
      end
  end
end