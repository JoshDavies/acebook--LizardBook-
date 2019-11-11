class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :comment_likes

  validates :username, presence: true, uniqueness: true

  validates :password, presence: true, length: { minimum: 6, maximum: 10 }, :if => :password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :full_name, presence: true
  validates :birthday, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
