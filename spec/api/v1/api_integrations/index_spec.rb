require 'rails_helper'

RSpec.describe "api_integrations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/api_integrations", params: params
  end

  describe 'basic fetch' do
    let!(:api_integration1) { create(:api_integration) }
    let!(:api_integration2) { create(:api_integration) }

    it 'works' do
      expect(ApiIntegrationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['api_integrations'])
      expect(d.map(&:id)).to match_array([api_integration1.id, api_integration2.id])
    end
  end
end
