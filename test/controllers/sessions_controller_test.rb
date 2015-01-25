require 'test_helper'
require 'minitest/mock'

class SessionsControllerTest < ActionController::TestCase

  def auth_hash
    auth_hash = {:uid => 123456,
       :info => {
          :name  => 'Lebowski',
          :email => 'dude@lebowski.lan'
        }
    }
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "create should login user" do

    User.stub(:login_from_facebook,users(:chris)) do
      post :create, auth_hash
    end

    assert_redirected_to home_url
    assert_equal users(:chris).id, session[:user_id]
  end

  test "redirects javascript" do

    User.stub(:login_from_facebook,users(:chris)) do
      post :create,{:format => :js}.merge(auth_hash)
    end

    assert_equal "true", @response.body 
    assert_equal users(:chris).id, session[:user_id]

  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "has a login route" do
    assert_recognizes({controller: 'sessions', action: 'new'},'/login')
  end

  test "has a logout route" do
    assert_recognizes({controller: 'sessions', action: 'destroy'},'/logout')
  end

end
