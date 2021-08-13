class AddStateMachineCountToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :state_machines_count, :integer
  end
end
