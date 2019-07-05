# frozen_string_literal: true

json.extract! add_friend, :id, :created_at, :updated_at
json.url add_friend_url(add_friend, format: :json)
