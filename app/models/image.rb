# frozen_string_literal: true

class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :image_able, polymorphic: true, optional: true

  enum type: [ :avatar, :cover, :post ]

  validate :picture_size
  validates :image, presence: false

  scope :image_show, -> {where image_able_id: post.id}


  private
    def self.findByImageAndId(type, id)
      self.where(image_able_type: type, image_able_id: id).order('created_at desc')
    end

    # Validates the size of an uploaded picture.
    def picture_size
      if image.size > 5.megabytes
        errors.add(:image, "Dung lượng file vượt quá 5MB")
      end
    end


end
