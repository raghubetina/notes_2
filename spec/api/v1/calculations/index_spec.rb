require 'rails_helper'

RSpec.describe "calculations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/calculations", params: params
  end

  describe 'basic fetch' do
    let!(:calculation1) { create(:calculation) }
    let!(:calculation2) { create(:calculation) }

    it 'works' do
      expect(CalculationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['calculations'])
      expect(d.map(&:id)).to match_array([calculation1.id, calculation2.id])
    end
  end
end
