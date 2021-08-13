require 'rails_helper'

RSpec.describe CallbackResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'callbacks',
          attributes: { }
        }
      }
    end

    let(:instance) do
      CallbackResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Callback.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:callback) { create(:callback) }

    let(:payload) do
      {
        data: {
          id: callback.id.to_s,
          type: 'callbacks',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      CallbackResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { callback.reload.updated_at }
      # .and change { callback.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:callback) { create(:callback) }

    let(:instance) do
      CallbackResource.find(id: callback.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Callback.count }.by(-1)
    end
  end
end
