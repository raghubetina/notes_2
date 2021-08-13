class CreateControls < ActiveRecord::Migration[6.0]
  def change
    create_table :controls do |t|
      t.integer :on_screen_id
      t.integer :leads_to_screen_id
      t.string :copy
      t.text :crud

      t.timestamps
    end
  end
end
