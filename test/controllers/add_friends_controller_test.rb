# frozen_string_literal: true

require 'test_helper'

class AddFriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @add_friend = add_friends(:one)
  end

  test 'should get index' do
    get add_friends_url
    assert_response :success
  end

  test 'should get new' do
    get new_add_friend_url
    assert_response :success
  end

  test 'should create add_friend' do
    assert_difference('AddFriend.count') do
      post add_friends_url, params: { add_friend: {} }
    end

    assert_redirected_to add_friend_url(AddFriend.last)
  end

  test 'should show add_friend' do
    get add_friend_url(@add_friend)
    assert_response :success
  end

  test 'should get edit' do
    get edit_add_friend_url(@add_friend)
    assert_response :success
  end

  test 'should update add_friend' do
    patch add_friend_url(@add_friend), params: { add_friend: {} }
    assert_redirected_to add_friend_url(@add_friend)
  end

  test 'should destroy add_friend' do
    assert_difference('AddFriend.count', -1) do
      delete add_friend_url(@add_friend)
    end

    assert_redirected_to add_friends_url
  end
end
