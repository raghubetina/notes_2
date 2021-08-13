require "rails_helper"

RSpec.describe ControlResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "controls",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ControlResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Control.count }.by(1)
    end
  end

  describe "updating" do
    let!(:control) { create(:control) }

    let(:payload) do
      {
        data: {
          id: control.id.to_s,
          type: "controls",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ControlResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { control.reload.updated_at }
      # .and change { control.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:control) { create(:control) }

    let(:instance) do
      ControlResource.find(id: control.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Control.count }.by(-1)
    end
  end
end
