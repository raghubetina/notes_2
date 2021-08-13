class AddLeadsToScreenReferenceToControls < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :controls, :screens, column: :leads_to_screen_id
    add_index :controls, :leads_to_screen_id
    change_column_null :controls, :leads_to_screen_id, false
  end
end
