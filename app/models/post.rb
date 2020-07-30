class Post < ApplicationRecord
  validates :content, presence: true, unless: :image?
  belongs_to :user
  has_many :favorites
  belongs_to :category
  has_many :comments

  mount_uploader :image, ImageUploader
end
