require_dependency "foswipe/application_controller"

module Foswipe
  class UserGroupsController < ApplicationController
    before_action :set_user_group, only: [:show, :edit, :update, :destroy]

    # GET /user_groups
    def index
      if current_user.admin_or_agent?
        @user_groups = UserGroup.all
      else
        @user_groups = current_user.user_groups
      end
       
    end

    # GET /user_groups/1
    def show
    end

    # GET /user_groups/new
    def new
      @user_group = UserGroup.new
    end

    # GET /user_groups/1/edit
    def edit
    end

    # POST /user_groups
    def create
      @user_group = UserGroup.new(user_group_params)

      if @user_group.save
        redirect_to @user_group, notice: 'User group was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /user_groups/1
    def update
      if @user_group.update(user_group_params)
        redirect_to @user_group, notice: 'User group was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /user_groups/1
    def destroy
      @user_group.destroy
      redirect_to user_groups_url, notice: 'User group was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user_group
        @user_group = UserGroup.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_group_params
        params.require(:user_group).permit(:group_name, :users_attributes => [:id])
      end
  end
end
