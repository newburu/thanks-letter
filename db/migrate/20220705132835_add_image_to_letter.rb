class AddImageToLetter < ActiveRecord::Migration[7.0]
  def change
    add_column :letters, :image, :string
  end
end
