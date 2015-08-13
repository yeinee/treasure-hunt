json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :description, :is_complete, :hunter_id
  json.url post_url(post, format: :json)
end
