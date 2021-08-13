require 'rails_helper'

RSpec.describe "user_stories#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_stories/#{user_story.id}", params: params
  end

  describe 'basic fetch' do
    let!(:user_story) { create(:user_story) }

    it 'works' do
      expect(UserStoryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('user_stories')
      expect(d.id).to eq(user_story.id)
    end
  end
end
