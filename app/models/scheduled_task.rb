class ScheduledTask < ApplicationRecord
  # Direct associations

  belongs_to :project,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    description
  end
end
