class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :existing_process
      t.text :job_to_be_done
      t.text :struggling_moment
      t.text :other
      t.text :existing_database
      t.integer :user_id

      t.timestamps
    end
  end
end
