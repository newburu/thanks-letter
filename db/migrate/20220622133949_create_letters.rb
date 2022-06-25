class CreateLetters < ActiveRecord::Migration[7.0]
  def change
    create_table :letters do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
