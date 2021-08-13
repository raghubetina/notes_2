class AddOnScreenReferenceToControls < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :controls, :screens, column: :on_screen_id
    add_index :controls, :on_screen_id
    change_column_null :controls, :on_screen_id, false
  end
end
