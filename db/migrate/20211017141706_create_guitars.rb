class CreateGuitars < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.string :title, null: false
      t.text :body 
      t.string :price
      t.string :shop_url
      t.string :youtube_url
      t.string :guitar_image_id
      t.timestamps
    end
  end
end
