# frozen_string_literal: true

json.extract! admin_video, :id, :title, :created_at, :updated_at
json.url admin_video_url(admin_video, format: :json)
