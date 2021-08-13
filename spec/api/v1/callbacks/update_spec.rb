require 'rails_helper'

RSpec.describe "callbacks#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/callbacks/#{callback.id}", payload
  end

  describe 'basic update' do
    let!(:callback) { create(:callback) }

    let(:payload) do
      {
        data: {
          id: callback.id.to_s,
          type: 'callbacks',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CallbackResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { callback.reload.attributes }
    end
  end
end
