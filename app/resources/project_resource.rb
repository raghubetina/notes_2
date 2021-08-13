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

  has_many   :erd_urls

  has_many   :scheduled_tasks

  has_many   :state_machines

  has_many   :callbacks

  has_many   :screens

  has_many   :calculations

  has_many   :api_integrations

  has_many   :user_stories

  belongs_to :user

  # Indirect associations

end
