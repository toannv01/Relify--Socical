# frozen_string_literal: true

json.extract! activity, :id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
