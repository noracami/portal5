class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :store, null: false, foreign_key: true
      t.string :ip_address

      t.timestamps
    end
  end
end
