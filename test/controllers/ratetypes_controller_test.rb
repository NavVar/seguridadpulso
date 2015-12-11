require 'test_helper'

class RatetypesControllerTest < ActionController::TestCase
  setup do
    @ratetype = ratetypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ratetypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ratetype" do
    assert_difference('Ratetype.count') do
      post :create, ratetype: { name: @ratetype.name, unit: @ratetype.unit }
    end

    assert_redirected_to ratetype_path(assigns(:ratetype))
  end

  test "should show ratetype" do
    get :show, id: @ratetype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ratetype
    assert_response :success
  end

  test "should update ratetype" do
    patch :update, id: @ratetype, ratetype: { name: @ratetype.name, unit: @ratetype.unit }
    assert_redirected_to ratetype_path(assigns(:ratetype))
  end

  test "should destroy ratetype" do
    assert_difference('Ratetype.count', -1) do
      delete :destroy, id: @ratetype
    end

    assert_redirected_to ratetypes_path
  end
end
