class AddUserReferenceToProjects < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :projects, :users
    add_index :projects, :user_id
    change_column_null :projects, :user_id, false
  end
end
