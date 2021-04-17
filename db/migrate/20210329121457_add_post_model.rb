class AddPostModel < ActiveRecord::Migration[6.1]
  def change
        
    # Posts table
    create_table :posts do |t|
      t.string :photo_path
      t.string :content
      t.string :privacy
      t.integer :view_count
      t.timestamps
    end

    # Add FKs for Posts table
    add_reference :posts, :user, index: true
    add_foreign_key :posts, :users

  end
end
