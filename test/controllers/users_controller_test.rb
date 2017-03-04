require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = @ripley
    @new_user = {
      username: "newuser",
      email: "new_user@mail.net",
      first_name: "Firstly",
      last_name: "Lastly"
    }
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: @new_user }
    end

    assert_redirected_to user_url(User.last)
  end

  test "email must be unique" do
    User.create(@new_user)
    assert_no_difference('User.count') do
      post users_url, params: { user: @new_user }
    end

    assert flash[:alert]
    assert flash[:alert].messages.keys.include? :email
    assert flash[:alert].full_messages.first.include? "taken"
    # assert_redirected_to new_user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    before = @user.email
    new_email = "my_new_email@mail.net"

    new_params = {
      user: {
        username: @user.username,
        email: new_email,
        first_name: @user.first_name,
        last_name: @user.last_name
      }
    }

    patch user_url(@user), params: new_params

    @user.reload
    assert_not_equal @user.email, before
    assert_equal @user.email, new_email
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  test "should add favorite circuit" do
    assert_difference('User.find(@user.id).favorite_circuits.count') do
      post add_favorite_circuit_user_url(@user), params: { circuit_id: @squeezie.id }
    end
  end

  test "should show favorite circuits" do
    get favorite_circuits_user_url(@user)
    assert_response :success
  end

  test "should show user circuits" do
    get circuits_user_url(@user)
    assert_response :success
  end
end
