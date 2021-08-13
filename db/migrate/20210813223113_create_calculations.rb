class CreateCalculations < ActiveRecord::Migration[6.0]
  def change
    create_table :calculations do |t|
      t.text :description
      t.integer :project_id

      t.timestamps
    end
  end
end
