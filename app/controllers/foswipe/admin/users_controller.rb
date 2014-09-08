class Foswipe::Admin::UsersController < Foswipe::ApplicationController
  layout 'admin'
  def index
    if params[:approved] == "false"
      @users = Foswipe::User.find_all_by_approved(false)
    else
      @users = Foswipe::User.all
    end
  end
  
  def approve_user
  @user = Foswipe::User.find(params[:id])
  @user.approved = true
  if @user.save
    flash[:notice] = "#{@user.name} approved"
  else
    flash[:alert] = "#{@user.name} approval failure"
  end
  redirect_to :back
end
end
