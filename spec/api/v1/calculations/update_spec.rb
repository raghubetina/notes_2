require 'rails_helper'

RSpec.describe "calculations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/calculations/#{calculation.id}", payload
  end

  describe 'basic update' do
    let!(:calculation) { create(:calculation) }

    let(:payload) do
      {
        data: {
          id: calculation.id.to_s,
          type: 'calculations',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CalculationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { calculation.reload.attributes }
    end
  end
end
