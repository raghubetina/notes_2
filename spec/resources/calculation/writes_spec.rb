require "rails_helper"

RSpec.describe CalculationResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "calculations",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CalculationResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Calculation.count }.by(1)
    end
  end

  describe "updating" do
    let!(:calculation) { create(:calculation) }

    let(:payload) do
      {
        data: {
          id: calculation.id.to_s,
          type: "calculations",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CalculationResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { calculation.reload.updated_at }
      # .and change { calculation.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:calculation) { create(:calculation) }

    let(:instance) do
      CalculationResource.find(id: calculation.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Calculation.count }.by(-1)
    end
  end
end
