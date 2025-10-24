module Api
  module V1
    class ChatroomsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_chatroom, only: [ :show, :update, :destroy ]

      def index
        chatrooms = Chatroom.includes(:users)
        render json: chatrooms.as_json(include: :users)
      end

      def show
        render json: @chatroom.as_json(include: [ :users, messages: { include: :user } ])
      end

      def create
        chatroom = Chatroom.new(chatroom_params)

        if chatroom.save
          chatroom.user_ids = params[:user_ids] if params[:user_ids].present?
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
        chatroom = Chatroom.find_or_create_personal_chat(params[:user1_id], params[:user2_id])
        render json: chatroom.as_json(include: :users), status: :ok
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
