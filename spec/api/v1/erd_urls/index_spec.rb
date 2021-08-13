require "rails_helper"

RSpec.describe "erd_urls#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/erd_urls", params: params
  end

  describe "basic fetch" do
    let!(:erd_url1) { create(:erd_url) }
    let!(:erd_url2) { create(:erd_url) }

    it "works" do
      expect(ErdUrlResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["erd_urls"])
      expect(d.map(&:id)).to match_array([erd_url1.id, erd_url2.id])
    end
  end
end
