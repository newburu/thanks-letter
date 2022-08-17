class Letter < ApplicationRecord
  belongs_to :user
  has_one :letter_image

  validates :subject, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader
end
