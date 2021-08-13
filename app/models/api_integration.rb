class ApiIntegration < ApplicationRecord
  # Direct associations

  belongs_to :project

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    documentation
  end

end
