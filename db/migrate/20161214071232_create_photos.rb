class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.text :desc
      t.string :content_type
      t.integer :file_size
      t.string :file_name
      t.string :photo
      t.references :post, index: true

      t.timestamps
    end
  end
end
