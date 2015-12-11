json.array!(@development_rates) do |development_rate|
  json.extract! development_rate, :id, :name, :description
  json.url development_rate_url(development_rate, format: :json)
end
