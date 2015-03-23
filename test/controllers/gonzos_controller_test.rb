require 'test_helper'

class GonzosControllerTest < ActionController::TestCase
  setup do
    @gonzo = gonzos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gonzos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gonzo" do
    assert_difference('Gonzo.count') do
      post :create, gonzo: { body: @gonzo.body, title: @gonzo.title }
    end

    assert_redirected_to gonzo_path(assigns(:gonzo))
  end

  test "should show gonzo" do
    get :show, id: @gonzo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gonzo
    assert_response :success
  end

  test "should update gonzo" do
    patch :update, id: @gonzo, gonzo: { body: @gonzo.body, title: @gonzo.title }
    assert_redirected_to gonzo_path(assigns(:gonzo))
  end

  test "should destroy gonzo" do
    assert_difference('Gonzo.count', -1) do
      delete :destroy, id: @gonzo
    end

    assert_redirected_to gonzos_path
  end
end
