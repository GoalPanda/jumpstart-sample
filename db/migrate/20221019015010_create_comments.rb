class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :parent_id
      t.integer :user_id
      t.text :message
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
