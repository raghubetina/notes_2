require "rails_helper"

RSpec.describe "erd_urls#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/erd_urls/#{erd_url.id}"
  end

  describe "basic destroy" do
    let!(:erd_url) { create(:erd_url) }

    it "updates the resource" do
      expect(ErdUrlResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ErdUrl.count }.by(-1)
      expect { erd_url.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
