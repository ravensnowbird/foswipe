module Foswipe
  class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery
    before_action :authenticate_user!

    before_action :authorise_filter
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

    def authorise_filter
      policy = (params[:controller] + "_policy").classify.constantize.new(current_user,nil)
      query = params[:action].to_s + "?"
      unless policy.public_send(query)
        #error = NotAuthorizedError.new("not allowed to #{query} this #{params[:controller]}")
        #error.query, error.record, error.policy = query, params[:controller], policy
        #raise error
        redirect_to :back, notice: 'not allowed'
      end
    end

  end
end