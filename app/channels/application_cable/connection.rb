module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    # def connect
    #   self.current_user = find_verified_user
    # end
    def connect
        self.current_user = find_verified_user
        logger.add_tags "ActionCable", current_user.name
    end

    private

    # def find_verified_user
    #   User.first || reject_unauthorized_connection
    # end

    def find_verified_user
      if (user_id = request.session[:current_user_id])
        User.find_by(id: user_id) || reject_unauthorized_connection
      else
        reject_unauthorized_connection
      end
    end
  end
end
