class Project < ApplicationRecord
  # Direct associations

  has_many   :user_stories,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
