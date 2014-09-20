require 'test_helper'

module Foswipe
  class UserChatsControllerTest < ActionController::TestCase
    setup do
      @user_chat = user_chats(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:user_chats)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create user_chat" do
      assert_difference('UserChat.count') do
        post :create, user_chat: { agent_id: @user_chat.agent_id, content: @user_chat.content, customer_id: @user_chat.customer_id }
      end

      assert_redirected_to user_chat_path(assigns(:user_chat))
    end

    test "should show user_chat" do
      get :show, id: @user_chat
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @user_chat
      assert_response :success
    end

    test "should update user_chat" do
      patch :update, id: @user_chat, user_chat: { agent_id: @user_chat.agent_id, content: @user_chat.content, customer_id: @user_chat.customer_id }
      assert_redirected_to user_chat_path(assigns(:user_chat))
    end

    test "should destroy user_chat" do
      assert_difference('UserChat.count', -1) do
        delete :destroy, id: @user_chat
      end

      assert_redirected_to user_chats_path
    end
  end
end
