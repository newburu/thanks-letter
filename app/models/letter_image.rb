class LetterImage < ApplicationRecord
  mount_uploader :image, ImageUploader

  def self.select_list
    LetterImage.all.pluck(:name, :id)
  end

end
