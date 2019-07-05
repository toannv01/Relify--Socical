# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :images, as: :image_able
  has_many :videos, dependent: :destroy
  has_many :comments, as: :commentable

  accepts_nested_attributes_for :images, allow_destroy: true,
                                         reject_if: proc { |attributes| attributes['image'].blank? }

  scope :created_at, -> { order created_at: :desc }

  validates :context, presence: true, length: { maximum: 1000 }
  validates :like_count, :comment_count, :block, presence: false
end
