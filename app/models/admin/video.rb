# frozen_string_literal: true

module Admin
  class Video < ApplicationRecord
    has_one_attached :video
    validates :title, presence: true
    validate :check_video_type, :check_video_presence

    private

    def check_video_presence
      errors.add(:video, 'First attach the video please!') unless video.attached?
    end

    def check_video_type
      errors.add(:video, 'must be a video') if video.attached? && !video.content_type.start_with?('video/')
    end
  end
end
