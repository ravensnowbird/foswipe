json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :user, :attachment
  json.url comment_url(comment, format: :json)
end
