class AddProjectReferenceToCallbacks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :callbacks, :projects
    add_index :callbacks, :project_id
    change_column_null :callbacks, :project_id, false
  end
end
