class CreateEmployeePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_positions do |t|
      t.bigint :identificator
      t.boolean :position_cos_definer
      t.integer :cost
      t.float :cost_auto
      t.float :cost_fixed
      t.integer :description_auto
      t.boolean :description_definer
      t.integer :description_fixed
      t.string :item
      t.integer :type
      t.references :position_categories, null: false, foreign_key: true
      t.references :position_groups, null: false, foreign_key: true
      t.references :position_classifications, null: false, foreign_key: true
      t.references :position_types, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.timestamps
    end
  end
end
