class AddUserModel < ActiveRecord::Migration[6.1]
  def change

    # Users table
    create_table :users do |t|
      t.string :name
      t.string :username
      t.date :dob
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :bio
      t.boolean :is_admin
      t.string :remember_digest
      t.timestamps
    end

    # Add index for Users table
    add_index :users, :name, unique: true
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :phone_number, unique: true

  end
end
