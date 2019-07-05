class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true, optional: true
  after_create :increment_count
  after_destroy :decrement_count
  validates :content, length: {maximum:500}, presence: true

  def increment_count
    parent = commentable
    while parent.is_a? Comment
      parent = parent.commentable
    end
    parent.increment! :comments_count
  end

  def decrement_count
    parent = commentable
    
    while parent.is_a? Comment
      parent = parent.commentable
    end
    parent.decrement! :comments_count
  end

  def self.findByTypeAndId(type, id)
    self.where(commentable_type: type, commentable_id: id).limit(2).order('created_at desc')
  end
end
