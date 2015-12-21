json.array!(@sidekiq_tests) do |sidekiq_test|
  json.extract! sidekiq_test, :id, :text, :count
  json.url sidekiq_test_url(sidekiq_test, format: :json)
end
