require "rails_helper"

RSpec.describe "scheduled_tasks#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/scheduled_tasks", payload
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
          type: "scheduled_tasks",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(ScheduledTaskResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { ScheduledTask.count }.by(1)
    end
  end
end
