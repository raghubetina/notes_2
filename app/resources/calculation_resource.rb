class CalculationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :description, :string
  attribute :project_id, :integer

  # Direct associations

  belongs_to :project

  # Indirect associations
end
