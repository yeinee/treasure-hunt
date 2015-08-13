json.array!(@post_ratings) do |post_rating|
  json.extract! post_rating, :id, :post_id, :user_id, :rating
  json.url post_rating_url(post_rating, format: :json)
end
