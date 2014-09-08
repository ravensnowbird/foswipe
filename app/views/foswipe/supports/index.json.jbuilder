json.array!(@supports) do |support|
  json.extract! support, :id, :name, :email
  json.url support_url(support, format: :json)
end
