require "rails_helper"

RSpec.describe "scheduled_tasks#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/scheduled_tasks/#{scheduled_task.id}"
  end

  describe "basic destroy" do
    let!(:scheduled_task) { create(:scheduled_task) }

    it "updates the resource" do
      expect(ScheduledTaskResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ScheduledTask.count }.by(-1)
      expect { scheduled_task.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
