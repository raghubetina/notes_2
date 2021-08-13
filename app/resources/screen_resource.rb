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

  belongs_to :project

  # Indirect associations

end
