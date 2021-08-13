require 'rails_helper'

RSpec.describe UserStoryResource, type: :resource do
  describe 'serialization' do
    let!(:user_story) { create(:user_story) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(user_story.id)
      expect(data.jsonapi_type).to eq('user_stories')
    end
  end

  describe 'filtering' do
    let!(:user_story1) { create(:user_story) }
    let!(:user_story2) { create(:user_story) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: user_story2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([user_story2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:user_story1) { create(:user_story) }
      let!(:user_story2) { create(:user_story) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            user_story1.id,
            user_story2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            user_story2.id,
            user_story1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
