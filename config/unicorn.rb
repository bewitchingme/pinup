worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

TERM = 'TERM'
QUIT = 'QUIT'

before_fork do |server, worker|
  Signal.trap TERM {
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill QUIT, Process.pid
  }
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap TERM { puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT' }
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end