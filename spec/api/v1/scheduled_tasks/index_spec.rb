require "rails_helper"

RSpec.describe "scheduled_tasks#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/scheduled_tasks", params: params
  end

  describe "basic fetch" do
    let!(:scheduled_task1) { create(:scheduled_task) }
    let!(:scheduled_task2) { create(:scheduled_task) }

    it "works" do
      expect(ScheduledTaskResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["scheduled_tasks"])
      expect(d.map(&:id)).to match_array([scheduled_task1.id,
                                          scheduled_task2.id])
    end
  end
end
