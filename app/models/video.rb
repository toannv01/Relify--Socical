# frozen_string_literal: true

class Video < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :post, :optional => true

  mount_uploader :video, VideoUploader
  # validates_attachment_size( :in => 1..1.megabyte)
  # validates_attachment_content_type :video, :content_type => ['application/x-shockwave-flash', 'application/x-shockwave-flash', 'application/flv', 'video/x-flv']
  # has_attached_file :video,
  #   processors: [:ffmpeg],
  #     :size => { :in => 0..25.megabytes }
  validates :video, presence: true, file_size: { less_than: 20.megabytes }

  private
  def self.findByVideoAndId(id)
    self.where(post_id: id)
  end
end
