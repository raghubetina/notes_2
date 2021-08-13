class AddProjectReferenceToErdUrls < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :erd_urls, :projects
    add_index :erd_urls, :project_id
    change_column_null :erd_urls, :project_id, false
  end
end
