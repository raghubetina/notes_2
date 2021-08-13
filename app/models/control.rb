class Control < ApplicationRecord
  # Direct associations

  belongs_to :on_screen,
             :class_name => "Screen"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    on_screen.to_s
  end

end
