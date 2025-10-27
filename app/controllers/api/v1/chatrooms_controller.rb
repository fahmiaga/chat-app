module Api
  module V1
    class ChatroomsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_chatroom, only: [ :show, :update, :destroy ]

      def index
        chatrooms = current_user&.chatrooms&.includes(:users) || []
        render json: chatrooms.as_json(include: :users)
      end

      def show
        render json: @chatroom.as_json(include: [ :users, messages: { include: :user } ])
      end

      def create
        chatroom = Chatroom.new(chatroom_params)

        if chatroom.save
          user_ids = params[:user_ids] || []
          user_ids << current_user.id unless user_ids.include?(current_user.id)

          chatroom.user_ids = user_ids
          chatroom.save!

          chatroom.users.each do |user|
            payload = {
              action: "new_chatroom",
              chatroom: chatroom.as_json(include: :users)
            }

            ActionCable.server.broadcast("chatrooms:#{user.id}", payload)
          end

          render json: chatroom.as_json(include: :users), status: :created
        else
          render json: { errors: chatroom.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
      end

      def destroy
      end

      def personal
        other_user = User.find(params[:user_id])
        chatroom = Chatroom.find_or_create_personal_chat(current_user.id, other_user.id)

        [ current_user, other_user ].each do |user|
           payload = {
              action: "new_chatroom",
              chatroom: chatroom.as_json(include: :users)
            }

            ActionCable.server.broadcast("chatrooms:#{user.id}", payload)
        end

        render json: chatroom.as_json(include: :users), status: :created
      end


      private

      def set_chatroom
        @chatroom = Chatroom.find(params[:id])
      end

      def chatroom_params
        params.require(:chatroom).permit(:name, :chat_type)
      end
    end
  end
end
