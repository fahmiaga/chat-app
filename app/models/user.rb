class User < ApplicationRecord
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages
end
