require 'test_helper'

class NewsfeedDemosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newsfeed_demo = newsfeed_demos(:one)
  end

  test "should get index" do
    get newsfeed_demos_url
    assert_response :success
  end

  test "should get new" do
    get new_newsfeed_demo_url
    assert_response :success
  end

  test "should create newsfeed_demo" do
    assert_difference('NewsfeedDemo.count') do
      post newsfeed_demos_url, params: { newsfeed_demo: {  } }
    end

    assert_redirected_to newsfeed_demo_url(NewsfeedDemo.last)
  end

  test "should show newsfeed_demo" do
    get newsfeed_demo_url(@newsfeed_demo)
    assert_response :success
  end

  test "should get edit" do
    get edit_newsfeed_demo_url(@newsfeed_demo)
    assert_response :success
  end

  test "should update newsfeed_demo" do
    patch newsfeed_demo_url(@newsfeed_demo), params: { newsfeed_demo: {  } }
    assert_redirected_to newsfeed_demo_url(@newsfeed_demo)
  end

  test "should destroy newsfeed_demo" do
    assert_difference('NewsfeedDemo.count', -1) do
      delete newsfeed_demo_url(@newsfeed_demo)
    end

    assert_redirected_to newsfeed_demos_url
  end
end
