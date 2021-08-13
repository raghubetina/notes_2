require "rails_helper"

RSpec.describe "callbacks#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/callbacks", params: params
  end

  describe "basic fetch" do
    let!(:callback1) { create(:callback) }
    let!(:callback2) { create(:callback) }

    it "works" do
      expect(CallbackResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["callbacks"])
      expect(d.map(&:id)).to match_array([callback1.id, callback2.id])
    end
  end
end
