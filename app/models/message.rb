class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :content, presence: true

  after_create_commit { broadcast_append_to "chatroom_#{chatroom_id}" }
end
