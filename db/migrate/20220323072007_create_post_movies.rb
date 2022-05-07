class CreatePostMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :post_movies do |t|
      t.integer :user_id
      t.string :youtube_url ,null:false
      t.string :title
      t.string :body
      t.integer :password
      t.timestamps
    end
  end
end
