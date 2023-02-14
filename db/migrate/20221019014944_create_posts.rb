class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :parent_id
      t.integer :user_id
      t.string :title
      t.integer :flag, default: 0
      t.text :message
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
