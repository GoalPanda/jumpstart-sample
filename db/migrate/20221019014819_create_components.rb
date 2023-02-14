class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components do |t|
      t.string :name
      t.string :code
      t.text :description
      t.float :budget
      t.integer :color, default: 0
      t.integer :status, default: 0
      t.integer :flag, default: 0
      t.integer :parent_id
      t.integer :user_id
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
