class CreateErdUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :erd_urls do |t|
      t.integer :project_id
      t.string :ideas_url
      t.string :image

      t.timestamps
    end
  end
end
