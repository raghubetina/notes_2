class AddProjectReferenceToCalculations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :calculations, :projects
    add_index :calculations, :project_id
    change_column_null :calculations, :project_id, false
  end
end
