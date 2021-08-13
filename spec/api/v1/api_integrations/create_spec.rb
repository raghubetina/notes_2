require 'rails_helper'

RSpec.describe "api_integrations#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/api_integrations", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'api_integrations',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ApiIntegrationResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ApiIntegration.count }.by(1)
    end
  end
end
