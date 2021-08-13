class AddEventReferenceToCallbacks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :callbacks, :events
    add_index :callbacks, :event_id
    change_column_null :callbacks, :event_id, false
  end
end
