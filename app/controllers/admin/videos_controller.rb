# frozen_string_literal: true

module Admin
  class VideosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_admin_video, only: %i[show destroy]

    def index
      @admin_videos = Admin::Video.all
    end

    def show; end

    # GET /admin/videos/new
    def new
      @admin_video = Admin::Video.new
    end

    def create
      @admin_video = Admin::Video.new(admin_video_params)

      respond_to do |format|
        if @admin_video.save
          format.html { redirect_to admin_video_url(@admin_video), notice: 'Video was successfully created.' }
          format.json { render :show, status: :created, location: @admin_video }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @admin_video.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @admin_video.destroy

      respond_to do |format|
        format.html { redirect_to admin_videos_url, notice: 'Video was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_admin_video
      @admin_video = Admin::Video.find(params[:id])
    end

    def admin_video_params
      params.require(:admin_video).permit(:title, :video)
    end
  end
end
