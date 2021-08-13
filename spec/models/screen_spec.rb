require 'rails_helper'

RSpec.describe Screen, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:outgoing_controls) }

    it { should belong_to(:project) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
