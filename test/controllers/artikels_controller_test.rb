require 'test_helper'

class ArtikelsControllerTest < ActionController::TestCase
  setup do
    @artikel = artikels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artikels)
  end

  test "should create artikel" do
    assert_difference('Artikel.count') do
      post :create, artikel: { content: @artikel.content, title: @artikel.title }
    end

    assert_response 201
  end

  test "should show artikel" do
    get :show, id: @artikel
    assert_response :success
  end

  test "should update artikel" do
    put :update, id: @artikel, artikel: { content: @artikel.content, title: @artikel.title }
    assert_response 204
  end

  test "should destroy artikel" do
    assert_difference('Artikel.count', -1) do
      delete :destroy, id: @artikel
    end

    assert_response 204
  end
end
