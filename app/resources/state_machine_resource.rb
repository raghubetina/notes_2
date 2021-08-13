class StateMachineResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :link_to_diagram, :string
  attribute :project_id, :integer
  attribute :notes, :string
  attribute :dsl, :string
  attribute :diagram, :string
  attribute :table, :string
  attribute :column, :string

  # Direct associations

  belongs_to :project

  # Indirect associations
end
