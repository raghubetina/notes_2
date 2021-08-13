require "rails_helper"

RSpec.describe "erd_urls#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/erd_urls/#{erd_url.id}", payload
  end

  describe "basic update" do
    let!(:erd_url) { create(:erd_url) }

    let(:payload) do
      {
        data: {
          id: erd_url.id.to_s,
          type: "erd_urls",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ErdUrlResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { erd_url.reload.attributes }
    end
  end
end
