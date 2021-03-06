require "rails_helper"

RSpec.describe Project, type: :model do
  describe "Direct Associations" do
    it { should have_many(:erd_urls) }

    it { should have_many(:scheduled_tasks) }

    it { should have_many(:state_machines) }

    it { should have_many(:callbacks) }

    it { should have_many(:screens) }

    it { should have_many(:calculations) }

    it { should have_many(:api_integrations) }

    it { should have_many(:user_stories) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
