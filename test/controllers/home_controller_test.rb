require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test 'assigns the current user if logged in' do
    get :index, {}, {:user_id => users(:chris).id}

    assert_equal users(:chris), assigns(:user), 'User not assigned'
  end
end
