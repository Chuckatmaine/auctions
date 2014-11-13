require 'test_helper'

class SharksControllerTest < ActionController::TestCase
  setup do
    @shark = sharks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sharks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shark" do
    assert_difference('Shark.count') do
      post :create, shark: { species: @shark.species, tag_id: @shark.tag_id }
    end

    assert_redirected_to shark_path(assigns(:shark))
  end

  test "should show shark" do
    get :show, id: @shark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shark
    assert_response :success
  end

  test "should update shark" do
    patch :update, id: @shark, shark: { species: @shark.species, tag_id: @shark.tag_id }
    assert_redirected_to shark_path(assigns(:shark))
  end

  test "should destroy shark" do
    assert_difference('Shark.count', -1) do
      delete :destroy, id: @shark
    end

    assert_redirected_to sharks_path
  end
end
