class CreateAuthentications < ActiveRecord::Migration[5.0]
  def change
    create_table :authentications do |t|
      t.string :provider, limit: 64
      t.string :uid, limit: 128
      t.string :token, limit: 128
      t.references :user, index: true

      t.timestamps
    end
  end
end
