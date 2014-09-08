module Foswipe
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    def after_sign_in_path_for(resource)
      if current_user.type == "Admin"
        admin_tickets_path
      else if current_user.type == "Client"
        clients_path
      else
        supports_path
      end
    end
  end
end
