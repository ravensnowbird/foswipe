module Foswipe
  class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
      if current_user.admin?
        admin_tickets_path
      elsif current_user.agent?
        supports_path
      elsif curent_user.customer?
        clients_path
      end
    end

  end
end