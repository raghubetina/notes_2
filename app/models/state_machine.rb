class StateMachine < ApplicationRecord
  # Direct associations

  belongs_to :project,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    column
  end

end
