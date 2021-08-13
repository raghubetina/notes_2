require "rails_helper"

RSpec.describe "erd_urls#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/erd_urls/#{erd_url.id}", params: params
  end

  describe "basic fetch" do
    let!(:erd_url) { create(:erd_url) }

    it "works" do
      expect(ErdUrlResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("erd_urls")
      expect(d.id).to eq(erd_url.id)
    end
  end
end
