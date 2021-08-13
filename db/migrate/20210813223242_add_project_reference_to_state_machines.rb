class AddProjectReferenceToStateMachines < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :state_machines, :projects
    add_index :state_machines, :project_id
    change_column_null :state_machines, :project_id, false
  end
end
