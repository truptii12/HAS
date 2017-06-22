require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @appointment = appointments(:one)
  end

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post :create, appointment: { appointmentdate: @appointment.appointmentdate, comment: @appointment.comment, doctor_id: @appointment.doctor_id, patient_id: @appointment.patient_id, startTime: @appointment.startTime }
    end

    assert_redirected_to appointment_path(assigns(:appointment))
  end

  test "should show appointment" do
    get :show, id: @appointment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointment
    assert_response :success
  end

  test "should update appointment" do
    patch :update, id: @appointment, appointment: { appointmentdate: @appointment.appointmentdate, comment: @appointment.comment, doctor_id: @appointment.doctor_id, patient_id: @appointment.patient_id, startTime: @appointment.startTime }
    assert_redirected_to appointment_path(assigns(:appointment))
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete :destroy, id: @appointment
    end

    assert_redirected_to appointments_path
  end
end
