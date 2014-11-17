#!/usr/bin/env ruby

require 'crawler/engine'

# You might want to change this
ENV["RAILS_ENV"] ||= "production"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")

Signal.trap("TERM") do 
  Crawler::Engine.stop
end

Crawler::Engine.start