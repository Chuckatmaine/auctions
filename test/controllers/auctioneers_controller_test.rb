require 'test_helper'

class AuctioneersControllerTest < ActionController::TestCase
  setup do
    @auctioneer = auctioneers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auctioneers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auctioneer" do
    assert_difference('Auctioneer.count') do
      post :create, auctioneer: { auction_id: @auctioneer.auction_id, create: @auctioneer.create, destroy: @auctioneer.destroy, user_id: @auctioneer.user_id }
    end

    assert_redirected_to auctioneer_path(assigns(:auctioneer))
  end

  test "should show auctioneer" do
    get :show, id: @auctioneer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auctioneer
    assert_response :success
  end

  test "should update auctioneer" do
    patch :update, id: @auctioneer, auctioneer: { auction_id: @auctioneer.auction_id, create: @auctioneer.create, destroy: @auctioneer.destroy, user_id: @auctioneer.user_id }
    assert_redirected_to auctioneer_path(assigns(:auctioneer))
  end

  test "should destroy auctioneer" do
    assert_difference('Auctioneer.count', -1) do
      delete :destroy, id: @auctioneer
    end

    assert_redirected_to auctioneers_path
  end
end
