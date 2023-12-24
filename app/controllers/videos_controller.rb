# frozen_string_literal: true

class VideosController < ApplicationController
  def index
    @videos = Admin::Video.all
  end

  def show
    @video = Admin::Video.find_by(id: params[:id])
    @related_videos = Admin::Video.where.not(id: @video.id).limit(10)
  end
end
