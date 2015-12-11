require 'test_helper'

class DevelopmentRatesControllerTest < ActionController::TestCase
  setup do
    @development_rate = development_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:development_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create development_rate" do
    assert_difference('DevelopmentRate.count') do
      post :create, development_rate: { description: @development_rate.description, name: @development_rate.name }
    end

    assert_redirected_to development_rate_path(assigns(:development_rate))
  end

  test "should show development_rate" do
    get :show, id: @development_rate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @development_rate
    assert_response :success
  end

  test "should update development_rate" do
    patch :update, id: @development_rate, development_rate: { description: @development_rate.description, name: @development_rate.name }
    assert_redirected_to development_rate_path(assigns(:development_rate))
  end

  test "should destroy development_rate" do
    assert_difference('DevelopmentRate.count', -1) do
      delete :destroy, id: @development_rate
    end

    assert_redirected_to development_rates_path
  end
end
