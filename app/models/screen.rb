class Screen < ApplicationRecord
  mount_uploader :wireframe, WireframeUploader

  # Direct associations

  has_many   :incoming_controls,
             class_name: "Control",
             foreign_key: "leads_to_screen_id",
             dependent: :destroy

  has_many   :outgoing_controls,
             class_name: "Control",
             foreign_key: "on_screen_id",
             dependent: :destroy

  belongs_to :project

  # Indirect associations

  has_many   :incoming_screens,
             through: :incoming_controls,
             source: :on_screen

  has_many   :leads_to_screens,
             through: :outgoing_controls,
             source: :leads_to_screen

  # Validations

  # Scopes

  def to_s
    title
  end
end
