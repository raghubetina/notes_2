class ScheduledTaskResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :recurring, :boolean
  attribute :occurence_schedule, :string
  attribute :project_id, :integer
  attribute :description, :string

  # Direct associations

  # Indirect associations

end
