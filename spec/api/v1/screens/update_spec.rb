require 'rails_helper'

RSpec.describe "screens#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/screens/#{screen.id}", payload
  end

  describe 'basic update' do
    let!(:screen) { create(:screen) }

    let(:payload) do
      {
        data: {
          id: screen.id.to_s,
          type: 'screens',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ScreenResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { screen.reload.attributes }
    end
  end
end
