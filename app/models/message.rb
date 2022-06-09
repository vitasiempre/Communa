class Message < ApplicationRecord
  has_one :message_status
  belongs_to :user
  belongs_to :chat
end
