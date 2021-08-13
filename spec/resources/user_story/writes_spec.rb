require 'rails_helper'

RSpec.describe UserStoryResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'user_stories',
          attributes: { }
        }
      }
    end

    let(:instance) do
      UserStoryResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { UserStory.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:user_story) { create(:user_story) }

    let(:payload) do
      {
        data: {
          id: user_story.id.to_s,
          type: 'user_stories',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      UserStoryResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { user_story.reload.updated_at }
      # .and change { user_story.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:user_story) { create(:user_story) }

    let(:instance) do
      UserStoryResource.find(id: user_story.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { UserStory.count }.by(-1)
    end
  end
end
