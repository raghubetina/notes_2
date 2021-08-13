require 'rails_helper'

RSpec.describe "state_machines#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/state_machines/#{state_machine.id}", params: params
  end

  describe 'basic fetch' do
    let!(:state_machine) { create(:state_machine) }

    it 'works' do
      expect(StateMachineResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('state_machines')
      expect(d.id).to eq(state_machine.id)
    end
  end
end
