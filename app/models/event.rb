class Event < ApplicationRecord
  # Direct associations

  has_many   :callbacks,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
