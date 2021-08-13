class ApiIntegrationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :documentation, :string
  attribute :purpose, :string
  attribute :project_id, :integer
  attribute :example_endopoint, :string

  # Direct associations

  belongs_to :project

  # Indirect associations

end
