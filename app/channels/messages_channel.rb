class MessagesChannel < ApplicationCable::Channel
  def subscribed
    @chatroom = Chatroom.find(params[:chatroom_id])
    stream_for @chatroom
  end

  def unsubscribed
  end

  def typing(_data)
    MessagesChannel.broadcast_to(
      @chatroom,
      action: "typing",
      user_id: current_user.id,
      user_name: current_user.name
    )

    puts "======================================#{current_user.inspect}"
  end

  def stop_typing(_data)
    MessagesChannel.broadcast_to(
      @chatroom,
      action: "stop_typing",
      user_id: current_user.id,
      user_name: current_user.name
    )
  end
end
