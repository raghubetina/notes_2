require 'rails_helper'

RSpec.describe Control, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:leads_to_screen) }

    it { should belong_to(:on_screen) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
