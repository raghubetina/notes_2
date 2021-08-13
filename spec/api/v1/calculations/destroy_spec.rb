require 'rails_helper'

RSpec.describe "calculations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/calculations/#{calculation.id}"
  end

  describe 'basic destroy' do
    let!(:calculation) { create(:calculation) }

    it 'updates the resource' do
      expect(CalculationResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Calculation.count }.by(-1)
      expect { calculation.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
