class ControlResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :on_screen_id, :integer
  attribute :leads_to_screen_id, :integer
  attribute :copy, :string
  attribute :crud, :string

  # Direct associations

  belongs_to :leads_to_screen,
             resource: ScreenResource

  belongs_to :on_screen,
             resource: ScreenResource

  # Indirect associations

end
