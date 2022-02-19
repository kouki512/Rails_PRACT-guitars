class CreatePracticeImages < ActiveRecord::Migration[5.2]
  def change
    create_table :practice_images do |t|
      t.integer :practice_id
      t.string :tab_image_id
      t.timestamps
    end
  end
end
