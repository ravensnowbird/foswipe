module Foswipe
  class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery
    before_action :authenticate_user!
    #after_action :verify_authorized
    def after_sign_in_path_for(resource)
      if current_user.admin?
        admin_tickets_path
      elsif current_user.agent?
        supports_path
      elsif curent_user.customer?
        clients_path
      end
    end

    def authorise_filter(record = nil)
      policy = (params[:controller][0..-1] + "_policy").classify.constantize.new(current_user,record)
      query = params[:action].to_s + "?"
      unless policy.public_send(query)
        redirect_to :back, notice: 'not allowed'
      end
    end
    def user_params
      params.require(:user).permit(:name, :email, :first_name, :last_name, :password, :password_confirmation, :mobile_no, :address, :organization_id)
    end

  end
end