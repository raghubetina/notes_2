require 'rails_helper'

RSpec.describe "screens#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/screens/#{screen.id}", params: params
  end

  describe 'basic fetch' do
    let!(:screen) { create(:screen) }

    it 'works' do
      expect(ScreenResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('screens')
      expect(d.id).to eq(screen.id)
    end
  end
end
