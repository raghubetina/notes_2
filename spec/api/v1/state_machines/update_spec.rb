require 'rails_helper'

RSpec.describe "state_machines#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/state_machines/#{state_machine.id}", payload
  end

  describe 'basic update' do
    let!(:state_machine) { create(:state_machine) }

    let(:payload) do
      {
        data: {
          id: state_machine.id.to_s,
          type: 'state_machines',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(StateMachineResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { state_machine.reload.attributes }
    end
  end
end
