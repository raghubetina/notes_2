class Callback < ApplicationRecord
  # Direct associations

  belongs_to :event

  belongs_to :project

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event.to_s
  end
end
