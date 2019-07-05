# frozen_string_literal: true

require 'application_system_test_case'

class AddFriendsTest < ApplicationSystemTestCase
  setup do
    @add_friend = add_friends(:one)
  end

  test 'visiting the index' do
    visit add_friends_url
    assert_selector 'h1', text: 'Add Friends'
  end

  test 'creating a Add friend' do
    visit add_friends_url
    click_on 'New Add Friend'

    click_on 'Create Add friend'

    assert_text 'Add friend was successfully created'
    click_on 'Back'
  end

  test 'updating a Add friend' do
    visit add_friends_url
    click_on 'Edit', match: :first

    click_on 'Update Add friend'

    assert_text 'Add friend was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Add friend' do
    visit add_friends_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Add friend was successfully destroyed'
  end
end
