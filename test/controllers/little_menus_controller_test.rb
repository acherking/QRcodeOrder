require 'test_helper'

class LittleMenusControllerTest < ActionController::TestCase
  setup do
    @little_menu = little_menus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:little_menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create little_menu" do
    assert_difference('LittleMenu.count') do
      post :create, little_menu: { food_id: @little_menu.food_id, menu_id: @little_menu.menu_id, number: @little_menu.number, remark: @little_menu.remark }
    end

    assert_redirected_to little_menu_path(assigns(:little_menu))
  end

  test "should show little_menu" do
    get :show, id: @little_menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @little_menu
    assert_response :success
  end

  test "should update little_menu" do
    patch :update, id: @little_menu, little_menu: { food_id: @little_menu.food_id, menu_id: @little_menu.menu_id, number: @little_menu.number, remark: @little_menu.remark }
    assert_redirected_to little_menu_path(assigns(:little_menu))
  end

  test "should destroy little_menu" do
    assert_difference('LittleMenu.count', -1) do
      delete :destroy, id: @little_menu
    end

    assert_redirected_to little_menus_path
  end
end
