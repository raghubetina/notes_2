require 'rails_helper'

RSpec.describe "controls#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/controls/#{control.id}"
  end

  describe 'basic destroy' do
    let!(:control) { create(:control) }

    it 'updates the resource' do
      expect(ControlResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Control.count }.by(-1)
      expect { control.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
