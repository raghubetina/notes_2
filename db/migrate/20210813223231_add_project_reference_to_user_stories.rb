class AddProjectReferenceToUserStories < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_stories, :projects
    add_index :user_stories, :project_id
    change_column_null :user_stories, :project_id, false
  end
end
