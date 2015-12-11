json.array!(@rate_registers) do |rate_register|
  json.extract! rate_register, :id, :rate_value, :date_registered
  json.url rate_register_url(rate_register, format: :json)
end
