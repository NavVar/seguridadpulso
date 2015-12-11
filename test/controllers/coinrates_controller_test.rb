require 'test_helper'

class CoinratesControllerTest < ActionController::TestCase
  setup do
    @coinrate = coinrates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coinrates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coinrate" do
    assert_difference('Coinrate.count') do
      post :create, coinrate: { buy: @coinrate.buy, ratetype_id: @coinrate.ratetype_id, sale: @coinrate.sale, todate: @coinrate.todate }
    end

    assert_redirected_to coinrate_path(assigns(:coinrate))
  end

  test "should show coinrate" do
    get :show, id: @coinrate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coinrate
    assert_response :success
  end

  test "should update coinrate" do
    patch :update, id: @coinrate, coinrate: { buy: @coinrate.buy, ratetype_id: @coinrate.ratetype_id, sale: @coinrate.sale, todate: @coinrate.todate }
    assert_redirected_to coinrate_path(assigns(:coinrate))
  end

  test "should destroy coinrate" do
    assert_difference('Coinrate.count', -1) do
      delete :destroy, id: @coinrate
    end

    assert_redirected_to coinrates_path
  end
end
