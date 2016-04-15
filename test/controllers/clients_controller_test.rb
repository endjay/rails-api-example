require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: {  }
    end

    assert_response 201
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should update client" do
    put :update, id: @client, client: {  }
    assert_response 204
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_response 204
  end
end
