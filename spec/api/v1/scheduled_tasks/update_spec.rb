require "rails_helper"

RSpec.describe "scheduled_tasks#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/scheduled_tasks/#{scheduled_task.id}", payload
  end

  describe "basic update" do
    let!(:scheduled_task) { create(:scheduled_task) }

    let(:payload) do
      {
        data: {
          id: scheduled_task.id.to_s,
          type: "scheduled_tasks",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ScheduledTaskResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { scheduled_task.reload.attributes }
    end
  end
end
