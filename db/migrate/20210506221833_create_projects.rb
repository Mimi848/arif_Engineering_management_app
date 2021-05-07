class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :address
      t.date :started_on
      t.date :completed_on
      t.boolean :finished
      t.string :owner_name
      t.string :size
      t.integer :total_expense
      
      t.timestamps
    end
  end
end
