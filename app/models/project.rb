class Project < ApplicationRecord
  # Direct associations

  has_many   :erd_urls,
             dependent: :destroy

  has_many   :scheduled_tasks,
             dependent: :destroy

  has_many   :state_machines,
             dependent: :destroy

  has_many   :callbacks,
             dependent: :destroy

  has_many   :screens,
             dependent: :destroy

  has_many   :calculations,
             dependent: :destroy

  has_many   :api_integrations,
             dependent: :destroy

  has_many   :user_stories,
             dependent: :destroy

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
