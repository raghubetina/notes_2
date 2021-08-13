require 'rails_helper'

RSpec.describe "controls#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/controls/#{control.id}", params: params
  end

  describe 'basic fetch' do
    let!(:control) { create(:control) }

    it 'works' do
      expect(ControlResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('controls')
      expect(d.id).to eq(control.id)
    end
  end
end
