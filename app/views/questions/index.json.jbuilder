json.array!(@questions) do |question|
  json.extract! question, :id, :post_id, :number, :content, :answer
  json.url question_url(question, format: :json)
end
