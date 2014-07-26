require 'test_helper'

class DocFilesControllerTest < ActionController::TestCase
  setup do
    @doc_file = doc_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doc_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doc_file" do
    assert_difference('DocFile.count') do
      post :create, doc_file: { clarification: @doc_file.clarification, docOwner: @doc_file.docOwner, name: @doc_file.name, student_id: @doc_file.student_id }
    end

    assert_redirected_to doc_file_path(assigns(:doc_file))
  end

  test "should show doc_file" do
    get :show, id: @doc_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @doc_file
    assert_response :success
  end

  test "should update doc_file" do
    patch :update, id: @doc_file, doc_file: { clarification: @doc_file.clarification, docOwner: @doc_file.docOwner, name: @doc_file.name, student_id: @doc_file.student_id }
    assert_redirected_to doc_file_path(assigns(:doc_file))
  end

  test "should destroy doc_file" do
    assert_difference('DocFile.count', -1) do
      delete :destroy, id: @doc_file
    end

    assert_redirected_to doc_files_path
  end
end
