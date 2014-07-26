require 'test_helper'

class ScholarshipPetitionsControllerTest < ActionController::TestCase
  setup do
    @scholarship_petition = scholarship_petitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scholarship_petitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scholarship_petition" do
    assert_difference('ScholarshipPetition.count') do
      post :create, scholarship_petition: { approved: @scholarship_petition.approved, scholarship_id: @scholarship_petition.scholarship_id, student_id: @scholarship_petition.student_id }
    end

    assert_redirected_to scholarship_petition_path(assigns(:scholarship_petition))
  end

  test "should show scholarship_petition" do
    get :show, id: @scholarship_petition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scholarship_petition
    assert_response :success
  end

  test "should update scholarship_petition" do
    patch :update, id: @scholarship_petition, scholarship_petition: { approved: @scholarship_petition.approved, scholarship_id: @scholarship_petition.scholarship_id, student_id: @scholarship_petition.student_id }
    assert_redirected_to scholarship_petition_path(assigns(:scholarship_petition))
  end

  test "should destroy scholarship_petition" do
    assert_difference('ScholarshipPetition.count', -1) do
      delete :destroy, id: @scholarship_petition
    end

    assert_redirected_to scholarship_petitions_path
  end
end
