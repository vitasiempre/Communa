class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :profile

  has_many :chat_list_items
  has_many :chats, :through => :chat_list_items

  has_many :favourites
  # has_many :saved_profiles, :through => :favourites, class_name: "Profile", foreign_key: :profile_id
  has_many :saved_profiles, :through => :favourites, class_name: "Profile", source: :profile, foreign_key: :profile_id


  has_many :messages

  has_many :blocker_users
  has_many :blocked_users
end
