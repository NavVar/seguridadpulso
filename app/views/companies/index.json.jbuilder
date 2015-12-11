json.array!(@companies) do |company|
  json.extract! company, :id, :name, :background, :location, :contact_reference
  json.url company_url(company, format: :json)
end
