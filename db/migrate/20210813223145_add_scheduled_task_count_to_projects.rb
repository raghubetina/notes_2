class AddScheduledTaskCountToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :scheduled_tasks_count, :integer
  end
end
