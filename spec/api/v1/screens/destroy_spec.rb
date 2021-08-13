require "rails_helper"

RSpec.describe "screens#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/screens/#{screen.id}"
  end

  describe "basic destroy" do
    let!(:screen) { create(:screen) }

    it "updates the resource" do
      expect(ScreenResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Screen.count }.by(-1)
      expect { screen.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
