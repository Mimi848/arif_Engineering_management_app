class CreateLabours < ActiveRecord::Migration[6.1]
  def change
    create_table :labours do |t|
      t.date :weekend_date
      t.integer :weekly_expense
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
