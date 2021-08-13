class CreateUserStories < ActiveRecord::Migration[6.0]
  def change
    create_table :user_stories do |t|
      t.string :role
      t.text :capability
      t.text :benefit
      t.integer :project_id
      t.text :notes

      t.timestamps
    end
  end
end
