class Event::ScheduledEvent::RecurringEvent < Event::ScheduledEvent

  def init
    super
    self.recurring = true
  end
  
end