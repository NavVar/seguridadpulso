json.array!(@exchanges) do |exchange|
  json.extract! exchange, :id, :to_date, :buy_value, :ratetype_id, :rateclass_id
  json.url exchange_url(exchange, format: :json)
end
