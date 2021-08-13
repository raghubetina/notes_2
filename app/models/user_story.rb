class UserStory < ApplicationRecord
  # Direct associations

  belongs_to :project

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    role
  end
end
