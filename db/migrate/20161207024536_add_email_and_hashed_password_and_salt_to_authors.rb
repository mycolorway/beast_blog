class AddEmailAndHashedPasswordAndSaltToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :email, :string, limit: 255
    add_column :authors, :hashed_password, :string, limit: 65
    add_column :authors, :salt, :string, limit: 25
  end
end
