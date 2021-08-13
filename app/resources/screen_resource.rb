class ScreenResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :project_id, :integer
  attribute :wireframe, :string
  attribute :description, :string
  attribute :url_pattern, :string
  attribute :title, :string

  # Direct associations

  has_many   :incoming_controls,
             resource: ControlResource,
             foreign_key: :leads_to_screen_id

  has_many   :outgoing_controls,
             resource: ControlResource,
             foreign_key: :on_screen_id

  belongs_to :project

  # Indirect associations

  has_many :incoming_screens, resource: ScreenResource do
    assign_each do |screen, screens|
      screens.select do |s|
        s.id.in?(screen.incoming_screens.map(&:id))
      end
    end
  end

  has_many :leads_to_screens, resource: ScreenResource do
    assign_each do |screen, screens|
      screens.select do |s|
        s.id.in?(screen.leads_to_screens.map(&:id))
      end
    end
  end


  filter :on_screen_id, :integer do
    eq do |scope, value|
      scope.eager_load(:incoming_screens).where(:controls => {:on_screen_id => value})
    end
  end

  filter :leads_to_screen_id, :integer do
    eq do |scope, value|
      scope.eager_load(:leads_to_screens).where(:controls => {:leads_to_screen_id => value})
    end
  end
end
