# frozen_string_literal: true

json.extract! video, :id, :created_at, :updated_at
json.url video_url(video, format: :json)
