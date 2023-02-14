class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.integer :project_id
      t.integer :identificator
      t.integer :budget
      t.integer :number
      t.string :name
      t.string :code
      t.date :start
      t.date :end
      t.integer :duration
      t.integer :status
      t.integer :percentage
      t.integer :manager
      t.integer :supervisor
      t.integer :category, default: 0
      t.integer :classification, default: 0
      t.integer :group, default: 0
      t.integer :routine, default: 0
      t.integer :delivery, default: 0
      t.integer :scale, default: 0
      t.integer :sorting, default: 0
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
