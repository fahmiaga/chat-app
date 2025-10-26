class AddUniqueIndexToPrimaryKeys < ActiveRecord::Migration[8.0]
  def change
    add_index :users, :id, unique: true unless index_exists?(:users, :id, unique: true)
    add_index :chatrooms, :id, unique: true unless index_exists?(:chatrooms, :id, unique: true)
  end
end
