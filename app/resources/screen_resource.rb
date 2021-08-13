class ScreenResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :project_id, :integer
  attribute :wireframe, :string
  attribute :description, :string
  attribute :url_pattern, :string
  attribute :title, :string

  # Direct associations

  has_many   :incoming_controls,
             resource: ControlResource,
             foreign_key: :leads_to_screen_id

  has_many   :outgoing_controls,
             resource: ControlResource,
             foreign_key: :on_screen_id

  belongs_to :project

  # Indirect associations

end
