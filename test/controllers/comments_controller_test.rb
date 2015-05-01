require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  test "comment create, not signed in" do
    user    = FactoryGirl.create(:user)
    place   = FactoryGirl.create(:place, :user => user)

    assert_no_difference 'Comment.count' do
      post :create, {:place_id => place.id, :comment => {
          :message => 'yay',
          :rating => '5_stars'}
      }
    end
    assert_redirected_to new_user_session_path
  end

  test "comment create" do
    user    = FactoryGirl.create(:user)
    sign_in user

    place   = FactoryGirl.create(:place, :user => user)

    assert_difference 'Comment.count' do
      post :create, {:place_id => place.id, :comment => {
          :message => 'Whatever',
          :rating => '4_stars'}
      }
    end
    assert_redirected_to place_path(place)
    assert_equal 1, place.comments.count
  end

  test "comment create invalid" do
    user    = FactoryGirl.create(:user)
    sign_in user

    place   = FactoryGirl.create(:place, :user => user)

    assert_no_difference 'Comment.count' do
      post :create, {:place_id => place.id, :comment => {
          :message => '',
          :rating => ''}
      }
    end
    assert_redirected_to place_path(place)
    assert_equal 0, place.comments.count
  end
end
