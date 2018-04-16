require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    sign_in :user, User.where(:email => 'admin@example.com').first
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, params: {user: { role: "admin", password: 'bdsfkjfwl23', password_confirmation: 'bdsfkjfwl23', email: "test2@example.com", :firstname => "test", :lastname => "test" }}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, params: {id: @user}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @user}
    assert_response :success
  end

  test "should update user" do
    patch :update, params: {id: @user, user: { role: @user.role }}
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, params: {id: @user}
    end

    assert_redirected_to users_path
  end
end
