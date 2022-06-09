class MessageStatus < ApplicationRecord
  belongs_to :message
  has_one :user, :through => :message
end
