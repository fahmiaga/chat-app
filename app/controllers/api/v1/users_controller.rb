module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :authenticate_user!, only: [ :index ]

      def index
        users = User.where.not(id: current_user.id)
        render json: users
      end

      def create
        user = User.new(user_params)
        if user.save
          session[:current_user_id] = user.id
          render json: { message: "User registered", user: user }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password)
      end
    end
  end
end
