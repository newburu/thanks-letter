class LetterImage < ApplicationRecord
  mount_uploader :image, ImageUploader
end
