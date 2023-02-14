class CreatePositionRelatedTables < ActiveRecord::Migration[7.0]
  def change
    create_table :position_groups do |t|
      t.integer :identificator
      t.string :name
      t.text :description
      t.float :value
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end

    create_table :position_categories do |t|
      t.integer :identificator
      t.string :name
      t.text :description
      t.float :value
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end

    create_table :position_classifications do |t|
      t.integer :identificator
      t.string :name
      t.text :description
      t.float :value
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end

    create_table :position_types do |t|
      t.integer :identificator
      t.string :name
      t.text :description
      t.float :value
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
