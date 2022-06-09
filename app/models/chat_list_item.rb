class ChatListItem < ApplicationRecord
  belongs_to :user
  belongs_to :chat
end
