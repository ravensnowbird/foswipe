require_dependency "foswipe/application_controller"

module Foswipe
  class UserChatsController < ApplicationController
    before_action :set_user_chat, only: [:show, :edit, :update, :destroy]

    # GET /user_chats
    def index
      @user_chats = UserChat.all
    end

    # GET /user_chats/1
    def show
    end

    # GET /user_chats/new
    def new
      @user_chat = UserChat.new
    end

    # GET /user_chats/1/edit
    def edit
    end

    # POST /user_chats
    def create
      @user_chat = UserChat.new(user_chat_params)

      if @user_chat.save
        redirect_to @user_chat, notice: 'User chat was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /user_chats/1
    def update
      if @user_chat.update(user_chat_params)
        redirect_to @user_chat, notice: 'User chat was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /user_chats/1
    def destroy
      @user_chat.destroy
      redirect_to user_chats_url, notice: 'User chat was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user_chat
        @user_chat = UserChat.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_chat_params
        params.require(:user_chat).permit(:customer_id, :agent_id, :content)
      end
  end
end
