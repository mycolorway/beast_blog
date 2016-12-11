class AddEmailAndHashedPasswordAndSaltToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hashed_password, :string, limit: 65
    add_column :users, :salt, :string, limit: 25
  end
end
