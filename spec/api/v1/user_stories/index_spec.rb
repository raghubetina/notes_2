require 'rails_helper'

RSpec.describe "user_stories#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_stories", params: params
  end

  describe 'basic fetch' do
    let!(:user_story1) { create(:user_story) }
    let!(:user_story2) { create(:user_story) }

    it 'works' do
      expect(UserStoryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['user_stories'])
      expect(d.map(&:id)).to match_array([user_story1.id, user_story2.id])
    end
  end
end
