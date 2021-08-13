class CreateStateMachines < ActiveRecord::Migration[6.0]
  def change
    create_table :state_machines do |t|
      t.string :link_to_diagram
      t.integer :project_id
      t.text :notes
      t.text :dsl
      t.string :diagram
      t.string :table
      t.string :column

      t.timestamps
    end
  end
end
