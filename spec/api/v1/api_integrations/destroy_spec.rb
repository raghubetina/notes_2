require "rails_helper"

RSpec.describe "api_integrations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/api_integrations/#{api_integration.id}"
  end

  describe "basic destroy" do
    let!(:api_integration) { create(:api_integration) }

    it "updates the resource" do
      expect(ApiIntegrationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ApiIntegration.count }.by(-1)
      expect { api_integration.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
