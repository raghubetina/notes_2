class UserStoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :role, :string
  attribute :capability, :string
  attribute :benefit, :string
  attribute :project_id, :integer
  attribute :notes, :string

  # Direct associations

  belongs_to :project

  # Indirect associations
end
