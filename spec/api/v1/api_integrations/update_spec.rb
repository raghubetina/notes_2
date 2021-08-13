require "rails_helper"

RSpec.describe "api_integrations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/api_integrations/#{api_integration.id}", payload
  end

  describe "basic update" do
    let!(:api_integration) { create(:api_integration) }

    let(:payload) do
      {
        data: {
          id: api_integration.id.to_s,
          type: "api_integrations",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ApiIntegrationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { api_integration.reload.attributes }
    end
  end
end
