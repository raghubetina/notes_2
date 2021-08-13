class AddProjectReferenceToApiIntegrations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :api_integrations, :projects
    add_index :api_integrations, :project_id
    change_column_null :api_integrations, :project_id, false
  end
end
