require 'test_helper'

class RateclassesControllerTest < ActionController::TestCase
  setup do
    @rateclass = rateclasses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rateclasses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rateclass" do
    assert_difference('Rateclass.count') do
      post :create, rateclass: { name: @rateclass.name }
    end

    assert_redirected_to rateclass_path(assigns(:rateclass))
  end

  test "should show rateclass" do
    get :show, id: @rateclass
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rateclass
    assert_response :success
  end

  test "should update rateclass" do
    patch :update, id: @rateclass, rateclass: { name: @rateclass.name }
    assert_redirected_to rateclass_path(assigns(:rateclass))
  end

  test "should destroy rateclass" do
    assert_difference('Rateclass.count', -1) do
      delete :destroy, id: @rateclass
    end

    assert_redirected_to rateclasses_path
  end
end
