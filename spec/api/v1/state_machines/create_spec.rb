require "rails_helper"

RSpec.describe "state_machines#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/state_machines", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "state_machines",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(StateMachineResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { StateMachine.count }.by(1)
    end
  end
end
