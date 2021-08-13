require 'rails_helper'

RSpec.describe "api_integrations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/api_integrations/#{api_integration.id}", params: params
  end

  describe 'basic fetch' do
    let!(:api_integration) { create(:api_integration) }

    it 'works' do
      expect(ApiIntegrationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('api_integrations')
      expect(d.id).to eq(api_integration.id)
    end
  end
end
