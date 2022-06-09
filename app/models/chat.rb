class Chat < ApplicationRecord
  has_many :chat_list_items
  has_many :users, :through => :chat_list_items

  has_many :messages
end
