require 'rails_helper'

RSpec.describe ScreenResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'screens',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ScreenResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Screen.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:screen) { create(:screen) }

    let(:payload) do
      {
        data: {
          id: screen.id.to_s,
          type: 'screens',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ScreenResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { screen.reload.updated_at }
      # .and change { screen.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:screen) { create(:screen) }

    let(:instance) do
      ScreenResource.find(id: screen.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Screen.count }.by(-1)
    end
  end
end
