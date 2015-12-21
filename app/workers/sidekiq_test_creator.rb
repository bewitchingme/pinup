class SidekiqTestCreatorWorker
  include Sidekiq::Worker

  def perform(*args)
    SidekiqTest.create(text: "Sidekiq Worker Generated", count: 1)
  end
end
