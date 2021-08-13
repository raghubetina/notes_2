class CreateScheduledTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_tasks do |t|
      t.boolean :recurring
      t.text :occurence_schedule
      t.integer :project_id
      t.text :description

      t.timestamps
    end
  end
end
