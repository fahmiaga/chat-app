class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  after_create_commit :broadcast_message

  private

  def broadcast_message
    MessagesChannel.broadcast_to(chatroom, {
      id: id,
      content: content,
      chatroom_id: chatroom_id,
      user: {
        id: user.id,
        name: user.name
      },
      created_at: created_at
    })
  end
end
