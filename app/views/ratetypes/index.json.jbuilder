json.array!(@ratetypes) do |ratetype|
  json.extract! ratetype, :id, :name, :unit
  json.url ratetype_url(ratetype, format: :json)
end
