class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.references :post, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
