require 'rails_helper'

RSpec.describe "screens#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/screens", params: params
  end

  describe 'basic fetch' do
    let!(:screen1) { create(:screen) }
    let!(:screen2) { create(:screen) }

    it 'works' do
      expect(ScreenResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['screens'])
      expect(d.map(&:id)).to match_array([screen1.id, screen2.id])
    end
  end
end
