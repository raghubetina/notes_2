require 'rails_helper'

RSpec.describe Callback, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:event) }

    it { should belong_to(:project) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
