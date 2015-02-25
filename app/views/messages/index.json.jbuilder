json.array!(@messages) do |message|
  json.extract! message, :id, :receiver_id, :sender_id, :category, :title, :question, :reply, :deleted, :sent, :received, :red
  json.url message_url(message, format: :json)
end
