module Foswipe
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!
      
    def after_sign_in_path_for(resource)
      p "###################"
      p current_user.type
      if current_user.type == "Admin"
	     admin_tickets_path
      elsif current_user.type == "agent"
	     supports_path
      else
       clients_path
      end
    end

  end
end