require 'rails_helper'

RSpec.describe "callbacks#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/callbacks/#{callback.id}", params: params
  end

  describe 'basic fetch' do
    let!(:callback) { create(:callback) }

    it 'works' do
      expect(CallbackResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('callbacks')
      expect(d.id).to eq(callback.id)
    end
  end
end
