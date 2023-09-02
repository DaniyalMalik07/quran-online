# frozen_string_literal: true

class CreateAdminVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_videos do |t|
      t.string :title

      t.timestamps
    end
  end
end
