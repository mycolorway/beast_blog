class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 64
      t.string :email, limit: 255
      t.string :avatar, limit: 255

      t.string :name, limit: 64
      t.text :bio
      t.string :avatar, limit: 255


      t.timestamps
    end
  end
end
