class CreateApiIntegrations < ActiveRecord::Migration[6.0]
  def change
    create_table :api_integrations do |t|
      t.string :documentation
      t.string :purpose
      t.integer :project_id
      t.string :example_endopoint

      t.timestamps
    end
  end
end
