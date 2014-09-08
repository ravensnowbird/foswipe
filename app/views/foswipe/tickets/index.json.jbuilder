json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :description, :client_id, :support_id
  json.url ticket_url(ticket, format: :json)
end
