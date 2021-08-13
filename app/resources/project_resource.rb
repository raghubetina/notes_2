class ProjectResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :existing_process, :string
  attribute :job_to_be_done, :string
  attribute :struggling_moment, :string
  attribute :other, :string
  attribute :existing_database, :string
  attribute :user_id, :integer

  # Direct associations

  # Indirect associations

end
