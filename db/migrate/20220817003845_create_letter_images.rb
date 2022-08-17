class CreateLetterImages < ActiveRecord::Migration[7.0]
  def change
    create_table :letter_images do |t|
      t.string :name
      t.string :image
      t.integer :height
      t.integer :width
      t.integer :font_size
      t.integer :row_cnt
      t.integer :row_gap
      t.integer :start_top
      t.integer :start_left

      t.timestamps
    end
  end
end
