require "rails_helper"

RSpec.describe UserStory, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:project) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
