json.array!(@rateclasses) do |rateclass|
  json.extract! rateclass, :id, :name
  json.url rateclass_url(rateclass, format: :json)
end
