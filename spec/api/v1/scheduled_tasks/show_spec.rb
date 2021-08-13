require "rails_helper"

RSpec.describe "scheduled_tasks#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/scheduled_tasks/#{scheduled_task.id}", params: params
  end

  describe "basic fetch" do
    let!(:scheduled_task) { create(:scheduled_task) }

    it "works" do
      expect(ScheduledTaskResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("scheduled_tasks")
      expect(d.id).to eq(scheduled_task.id)
    end
  end
end
