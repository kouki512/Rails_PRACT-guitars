class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
      t.string :title
      t.text :body
      t.string :reference_url
      t.string :details
      t.string :youtube_url
      t.integer :textbook, default: 0, null:false
      t.string :other_text
      t.boolean :is_public , default: false
      t.boolean :is_finish, default: false
      t.integer :user_id
      t.timestamps
    end
  end
end
