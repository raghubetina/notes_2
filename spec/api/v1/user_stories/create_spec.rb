require 'rails_helper'

RSpec.describe "user_stories#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/user_stories", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'user_stories',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(UserStoryResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { UserStory.count }.by(1)
    end
  end
end
