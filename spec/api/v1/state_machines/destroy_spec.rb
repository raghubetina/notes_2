require "rails_helper"

RSpec.describe "state_machines#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/state_machines/#{state_machine.id}"
  end

  describe "basic destroy" do
    let!(:state_machine) { create(:state_machine) }

    it "updates the resource" do
      expect(StateMachineResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { StateMachine.count }.by(-1)
      expect { state_machine.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
