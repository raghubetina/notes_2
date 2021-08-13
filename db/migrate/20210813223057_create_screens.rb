class CreateScreens < ActiveRecord::Migration[6.0]
  def change
    create_table :screens do |t|
      t.integer :project_id
      t.string :wireframe
      t.text :description
      t.string :url_pattern
      t.string :title

      t.timestamps
    end
  end
end
