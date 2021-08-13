class CallbackResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :event_id, :integer
  attribute :project_id, :integer
  attribute :description, :string

  # Direct associations

  belongs_to :project

  # Indirect associations

end
