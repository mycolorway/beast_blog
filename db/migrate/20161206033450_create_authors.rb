class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio
      t.string :avatar

      t.timestamps
    end
  end
end
