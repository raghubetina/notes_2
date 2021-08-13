require 'rails_helper'

RSpec.describe "controls#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/controls", params: params
  end

  describe 'basic fetch' do
    let!(:control1) { create(:control) }
    let!(:control2) { create(:control) }

    it 'works' do
      expect(ControlResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['controls'])
      expect(d.map(&:id)).to match_array([control1.id, control2.id])
    end
  end
end
