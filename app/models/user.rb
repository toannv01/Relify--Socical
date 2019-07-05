# frozen_string_literal: true

class User < ApplicationRecord
  before_save :downcase_email
  has_secure_password
  # before_create {generate_token(:auth_token)}

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :posts, dependent: :destroy
  has_many :cities, dependent: :destroy
  has_many :countries, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :add_friends
  validates :email,  uniqueness: true
  has_many :images, as: :image_able
  has_many :videos, dependent: :destroy

  validates :first_name, :last_name, :birth, :sex, presence: true, length: { maximum: 32 }
  validates_format_of :first_name, :last_name, :with => /^[a-z][a-z\s]*$/i, :multiline => true,
                       length: { maximum: 32 }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, length: { maximum: 32 }
  validates :password, length: { within: 6..32 }, on: :create
  validates :introduction, length: { maximum: 500 }
  validates :city, :country, length: { maximum: 32 }

  validate :check_for_changes,on: :update

  def check_for_changes
    errors.add :email, "không thể thay đổi email" if email_changed?
  end
  # enum sex: {Male: 0, Female: 1}
  # enum sex: [ :male, :female, :unknown ]
  # def self.sexes_for_select
  # sexes.keys.map{ |x| [x.humanize, x] }
  # end

  def downcase_email
    self.email = email.downcase
  end

  def getToken
    auth_token = JsonWebToken.encode(user_id: id)
  end

#ham tim kiem user
  def self.search(param)
    param.strip!
    param.downcase!
    to_send_back = (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
    return nill unless to_send_back
    to_send_back
  end

  def self.first_name_matches(param)
    matches('first_name', param)
  end

  def self.last_name_matches(param)
    matches('last_name', param)
  end

  def self.email_matches(param)
    matches('email', param)
  end

  def self.matches(field_name, param)
    User.where("#{field_name} like ?", "%#{param}%")
  end
  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end
  def not_friends_with?(friend_id)
      friendships.where(friend_id: friend_id).count < 1
  end


   def send_password_resets
     generate_token(:password_reset_token)
     self.password_reset_sent_at = Time.zone.now
     save!
   end
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  # def check_email
  #   User.exists?(:email=>user.email)
  # end
end
