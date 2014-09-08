class Foswipe::Admin::UsersController < ApplicationController
  layout 'admin'
  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.all
    end
  end
  
  def approve_user
  @user = User.find(params[:id])
  @user.approved = true
  if @user.save
    flash[:notice] = "#{@user.name} approved"
  else
    flash[:alert] = "#{@user.name} approval failure"
  end
  redirect_to :back
end
end
