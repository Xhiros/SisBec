require 'test_helper'

class LunchPetitionsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get newPetition" do
    get :newPetition
    assert_response :success
  end

end
