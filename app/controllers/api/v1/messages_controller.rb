module Api
  module V1
    class MessagesController < ApplicationController
      skip_before_action :verify_authenticity_token


      def index
        chatroom = Chatroom.find(params[:chatroom_id])
        messages = chatroom.messages.includes(:user).order(:created_at)

        render json: messages.as_json(include: :user)
      end

      def create
        message = Message.new(message_params)

        if message.save
          render json: message.as_json(include: :user), status: :created
        else
          render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def message_params
        params.require(:message).permit(:chatroom_id, :user_id, :content)
      end
    end
  end
end
