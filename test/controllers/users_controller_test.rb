require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "user dashboard show page" do
    user    = FactoryGirl.create(:user)
    sign_in user

    get :show, :id => user.id
    assert_response :success
  end

  test "user dashboard, not found" do
    get :show, :id => 'OMG'
    assert_response :not_found
  end

end
