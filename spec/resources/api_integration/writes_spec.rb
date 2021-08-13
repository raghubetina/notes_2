require 'rails_helper'

RSpec.describe ApiIntegrationResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'api_integrations',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ApiIntegrationResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ApiIntegration.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:api_integration) { create(:api_integration) }

    let(:payload) do
      {
        data: {
          id: api_integration.id.to_s,
          type: 'api_integrations',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ApiIntegrationResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { api_integration.reload.updated_at }
      # .and change { api_integration.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:api_integration) { create(:api_integration) }

    let(:instance) do
      ApiIntegrationResource.find(id: api_integration.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ApiIntegration.count }.by(-1)
    end
  end
end
