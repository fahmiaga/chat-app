class Chatroom < ApplicationRecord
  has_many :chatroom_users, dependent: :destroy
  has_many :users, through: :chatroom_users
  has_many :messages, dependent: :destroy

 enum :chat_type, { group_chat: 0, personal: 1 }

  validates :name, presence: true, if: :group_chat?

  def self.find_or_create_personal_chat(user1_id, user2_id)
    existing = Chatroom.joins(:chatroom_users)
                       .where(chat_type: :personal)
                       .group("chatrooms.id")
                       .having("COUNT(chatroom_users.user_id) = 2")
                       .select { |c| c.user_ids.sort == [ user1_id, user2_id ].sort }
                       .first
    return existing if existing.present?

    chatroom = Chatroom.create!(chat_type: :personal)
    chatroom.user_ids = [ user1_id, user2_id ]
    chatroom
  end
end
