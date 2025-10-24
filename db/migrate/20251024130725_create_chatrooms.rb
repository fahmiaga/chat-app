class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.integer :chat_type, default: 0
      t.timestamps
    end
  end
end
