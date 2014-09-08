json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :name
  json.url purchase_url(purchase, format: :json)
end
