require 'rails_helper'

RSpec.describe "controls#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/controls/#{control.id}", payload
  end

  describe 'basic update' do
    let!(:control) { create(:control) }

    let(:payload) do
      {
        data: {
          id: control.id.to_s,
          type: 'controls',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ControlResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { control.reload.attributes }
    end
  end
end
