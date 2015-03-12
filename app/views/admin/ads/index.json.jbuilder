json.array!(ads) do |ad|
  json.extract! ad, :id
  json.url admin_ad_url(ad, format: :json)
end
