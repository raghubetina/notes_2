class AddProjectReferenceToScheduledTasks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :scheduled_tasks, :projects
    add_index :scheduled_tasks, :project_id
    change_column_null :scheduled_tasks, :project_id, false
  end
end
