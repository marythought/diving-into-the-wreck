require 'test_helper'

class OceansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ocean = oceans(:one)
  end

  test "should get index" do
    get oceans_url
    assert_response :success
  end

  test "should get new" do
    get new_ocean_url
    assert_response :success
  end

  test "should create ocean" do
    assert_difference('Ocean.count') do
      post oceans_url, params: { ocean: {  } }
    end

    assert_redirected_to ocean_url(Ocean.last)
  end

  test "should show ocean" do
    get ocean_url(@ocean)
    assert_response :success
  end

  test "should get edit" do
    get edit_ocean_url(@ocean)
    assert_response :success
  end

  test "should update ocean" do
    patch ocean_url(@ocean), params: { ocean: {  } }
    assert_redirected_to ocean_url(@ocean)
  end

  test "should destroy ocean" do
    assert_difference('Ocean.count', -1) do
      delete ocean_url(@ocean)
    end

    assert_redirected_to oceans_url
  end
end
