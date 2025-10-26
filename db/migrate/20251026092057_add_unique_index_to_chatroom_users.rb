class AddUniqueIndexToChatroomUsers < ActiveRecord::Migration[8.0]
  def change
    add_index :chatroom_users, [ :chatroom_id, :user_id ], unique: true
  end
end
