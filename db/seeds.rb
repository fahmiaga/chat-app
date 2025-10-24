# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



Message.destroy_all
ChatroomUser.destroy_all
Chatroom.destroy_all
User.destroy_all


User.create!([
  { name: "Fahmi", email: "fahmi@example.com" },
  { name: "John Doe", email: "john_doe@example.com" },
  { name: "Jane doe", email: "janedoe@example.com" },
  { name: "Bob Sponge", email: "bob_sponge@example.com" }
])
