json.extract! message_status, :id, :created_at, :updated_at
json.url message_status_url(message_status, format: :json)
