require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { address: @student.address, card_id: @student.card_id, career: @student.career, cellphone: @student.cellphone, children: @student.children, clarifications: @student.clarifications, department: @student.department, dependent: @student.dependent, disabilityOrIllness: @student.disabilityOrIllness, dni: @student.dni, dwelling: @student.dwelling, economicSituation: @student.economicSituation, familyGroup: @student.familyGroup, fileNumber: @student.fileNumber, firstName: @student.firstName, income: @student.income, lastName: @student.lastName, minors: @student.minors, otherCareer: @student.otherCareer, rental: @student.rental, schoolDays: @student.schoolDays, telephone: @student.telephone, vehicles: @student.vehicles }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { address: @student.address, card_id: @student.card_id, career: @student.career, cellphone: @student.cellphone, children: @student.children, clarifications: @student.clarifications, department: @student.department, dependent: @student.dependent, disabilityOrIllness: @student.disabilityOrIllness, dni: @student.dni, dwelling: @student.dwelling, economicSituation: @student.economicSituation, familyGroup: @student.familyGroup, fileNumber: @student.fileNumber, firstName: @student.firstName, income: @student.income, lastName: @student.lastName, minors: @student.minors, otherCareer: @student.otherCareer, rental: @student.rental, schoolDays: @student.schoolDays, telephone: @student.telephone, vehicles: @student.vehicles }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
