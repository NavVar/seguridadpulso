require 'test_helper'

class RateRegistersControllerTest < ActionController::TestCase
  setup do
    @rate_register = rate_registers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rate_registers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rate_register" do
    assert_difference('RateRegister.count') do
      post :create, rate_register: { date_registered: @rate_register.date_registered, rate_value: @rate_register.rate_value }
    end

    assert_redirected_to rate_register_path(assigns(:rate_register))
  end

  test "should show rate_register" do
    get :show, id: @rate_register
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rate_register
    assert_response :success
  end

  test "should update rate_register" do
    patch :update, id: @rate_register, rate_register: { date_registered: @rate_register.date_registered, rate_value: @rate_register.rate_value }
    assert_redirected_to rate_register_path(assigns(:rate_register))
  end

  test "should destroy rate_register" do
    assert_difference('RateRegister.count', -1) do
      delete :destroy, id: @rate_register
    end

    assert_redirected_to rate_registers_path
  end
end
