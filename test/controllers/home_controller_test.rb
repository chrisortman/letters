require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test 'when not logged in redirects to login url' do
    get :index

    assert_redirected_to login_url
  end

  test 'when session id is bogus redirects to login url' do
    get :index, {}, {:user_id => 99}

    assert_redirected_to login_url
  end

  test 'assigns the current user if logged in' do
    get :index, {}, {:user_id => users(:chris).id}

    assert_equal users(:chris), assigns(:user), 'User not assigned'
  end
end
