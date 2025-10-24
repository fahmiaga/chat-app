class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :content, presence: true

  after_create_commit do
    ActionCable.server.broadcast(
      "chatroom_#{chatroom_id}",
      as_json(include: :user)
    )
  end
end
