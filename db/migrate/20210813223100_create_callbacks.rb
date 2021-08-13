class CreateCallbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :callbacks do |t|
      t.integer :event_id
      t.integer :project_id
      t.string :description

      t.timestamps
    end
  end
end
