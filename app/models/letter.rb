class Letter < ApplicationRecord
  belongs_to :user

  validates :subject, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader
end
