require 'rails_helper'

RSpec.describe "calculations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/calculations/#{calculation.id}", params: params
  end

  describe 'basic fetch' do
    let!(:calculation) { create(:calculation) }

    it 'works' do
      expect(CalculationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('calculations')
      expect(d.id).to eq(calculation.id)
    end
  end
end
