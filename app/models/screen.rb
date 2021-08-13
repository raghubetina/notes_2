class Screen < ApplicationRecord
  # Direct associations

  has_many   :incoming_controls,
             :class_name => "Control",
             :foreign_key => "leads_to_screen_id",
             :dependent => :destroy

  has_many   :outgoing_controls,
             :class_name => "Control",
             :foreign_key => "on_screen_id",
             :dependent => :destroy

  belongs_to :project

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end
