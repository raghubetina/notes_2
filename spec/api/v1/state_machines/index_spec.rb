require "rails_helper"

RSpec.describe "state_machines#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/state_machines", params: params
  end

  describe "basic fetch" do
    let!(:state_machine1) { create(:state_machine) }
    let!(:state_machine2) { create(:state_machine) }

    it "works" do
      expect(StateMachineResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["state_machines"])
      expect(d.map(&:id)).to match_array([state_machine1.id, state_machine2.id])
    end
  end
end
