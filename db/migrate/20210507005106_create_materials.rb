class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.date :purchase_date
      t.float :per_unit_price
      t.integer :quantity
      t.integer :total_cost
      t.string :category
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
