module Api
  module V1
    class ChatroomsController < ApplicationController
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
          if params[:user_ids].present?
            chatroom.user_ids = params[:user_ids]
          end
          render json: chatroom, status: :created
        else
          render json: { errors: chatroom.errors.full_messages }, status: :unprocessable_entity
        end
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
