class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.integer :author_id
      t.string :code, limit: 32
      t.datetime :valid_before
      t.string :email
      t.string :name
      t.boolean :used, default: false

      t.timestamps
    end
  end
end
