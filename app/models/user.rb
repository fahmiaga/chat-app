class User < ApplicationRecord
  has_secure_password
  has_many :messages
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid email" }
end
