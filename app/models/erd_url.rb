class ErdUrl < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :project

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    ideas_url
  end

end
