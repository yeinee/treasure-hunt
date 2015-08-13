json.array!(@attachments) do |attachment|
  json.extract! attachment, :id, :parent_id, :parent_type, :file
  json.url attachment_url(attachment, format: :json)
end
