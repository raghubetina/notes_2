require 'rails_helper'

RSpec.describe ScreenResource, type: :resource do
  describe 'serialization' do
    let!(:screen) { create(:screen) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(screen.id)
      expect(data.jsonapi_type).to eq('screens')
    end
  end

  describe 'filtering' do
    let!(:screen1) { create(:screen) }
    let!(:screen2) { create(:screen) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: screen2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([screen2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:screen1) { create(:screen) }
      let!(:screen2) { create(:screen) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            screen1.id,
            screen2.id
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
            screen2.id,
            screen1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
