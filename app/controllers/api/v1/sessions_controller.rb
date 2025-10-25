module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          session[:current_user_id] = user.id
          render json: { message: "Logged in", user: user }, status: :ok
        else
          render json: { errors: [ "Invalid email or password" ] }, status: :unauthorized
        end
      end

      def destroy
        session.delete(:current_user_id)
        render json: { message: "Logged out" }, status: :ok
      end

      def show
        if current_user
          render json: current_user
        else
          render json: { user: nil }, status: :ok
        end
      end

      private

      def current_user
        @current_user ||= User.find_by(id: session[:current_user_id])
      end
    end
  end
end
