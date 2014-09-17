class Foswipe::UsersController < Foswipe::ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.all
    end
  end
  def edit
    
  end

  def approve_user
    
    @user.approved = true
    if @user.save
      flash[:notice] = "#{@user.name} approved"
    else
      flash[:alert] = "#{@user.name} approval failure"
    end
    redirect_to :back
  end

  def update
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to :back, notice: 'Admin was successfully updated.' }
        format.json { head :no_content }
      else
        if @user.admin?
          @admin = @user
          path = "/foswipe/admins/edit"
        elsif @user.agent?
             @support = @user
             path = "/foswipe/supports/edit"
        else
          path = "/foswipe/clients/edit"
        end
        format.html { render path }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @user = Foswipe::User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
  private
  def set_user
    @user = Foswipe::User.find(params[:id])
  end
end
