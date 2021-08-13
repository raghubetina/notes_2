require 'rails_helper'

RSpec.describe "user_stories#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/user_stories/#{user_story.id}"
  end

  describe 'basic destroy' do
    let!(:user_story) { create(:user_story) }

    it 'updates the resource' do
      expect(UserStoryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { UserStory.count }.by(-1)
      expect { user_story.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
