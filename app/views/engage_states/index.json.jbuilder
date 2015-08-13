json.array!(@engage_states) do |engage_state|
  json.extract! engage_state, :id, :user_id, :post_id, :question_number
  json.url engage_state_url(engage_state, format: :json)
end
