class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :post, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
