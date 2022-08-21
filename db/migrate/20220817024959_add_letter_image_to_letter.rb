class AddLetterImageToLetter < ActiveRecord::Migration[7.0]
  def change
    add_reference :letters, :letter_image, null: false, foreign_key: true
  end
end
