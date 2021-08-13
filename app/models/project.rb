class Project < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
