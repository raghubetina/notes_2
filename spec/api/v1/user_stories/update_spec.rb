require "rails_helper"

RSpec.describe "user_stories#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/user_stories/#{user_story.id}", payload
  end

  describe "basic update" do
    let!(:user_story) { create(:user_story) }

    let(:payload) do
      {
        data: {
          id: user_story.id.to_s,
          type: "user_stories",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(UserStoryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { user_story.reload.attributes }
    end
  end
end
