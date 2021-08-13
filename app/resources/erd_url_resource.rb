class ErdUrlResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :project_id, :integer
  attribute :ideas_url, :string
  attribute :image, :string

  # Direct associations

  # Indirect associations

end
