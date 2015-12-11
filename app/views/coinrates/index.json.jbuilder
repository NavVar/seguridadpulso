json.array!(@coinrates) do |coinrate|
  json.extract! coinrate, :id, :sale, :buy, :todate, :ratetype_id
  json.url coinrate_url(coinrate, format: :json)
end
