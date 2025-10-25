class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    user_id = params[:user_id]

    if user_id.present?
      stream_from "chatrooms:#{user_id}"
    else
      reject
    end
  end
end
