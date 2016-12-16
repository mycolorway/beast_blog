class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name, limit: 128

      t.timestamps
    end
  end
end
