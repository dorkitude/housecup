require 'test_helper'

class ProfessorControllerTest < ActionController::TestCase
  test "should get new_delta_form" do
    get :new_delta_form
    assert_response :success
  end

  test "should get new_delta_post" do
    get :new_delta_post
    assert_response :success
  end

end
