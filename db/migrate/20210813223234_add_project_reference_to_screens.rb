class AddProjectReferenceToScreens < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :screens, :projects
    add_index :screens, :project_id
    change_column_null :screens, :project_id, false
  end
end
