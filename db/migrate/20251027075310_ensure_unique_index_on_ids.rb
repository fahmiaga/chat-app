class EnsureUniqueIndexOnIds < ActiveRecord::Migration[8.0]
  def change
    add_index :users, :id, unique: true unless index_exists?(:users, :id, unique: true)
    add_index :chatrooms, :id, unique: true unless index_exists?(:chatrooms, :id, unique: true)
    add_index :messages, :id, unique: true unless index_exists?(:messages, :id, unique: true)
    add_index :chatroom_users, :id, unique: true unless index_exists?(:chatroom_users, :id, unique: true)
  end
end
