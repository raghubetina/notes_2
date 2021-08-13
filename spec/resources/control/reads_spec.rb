require 'rails_helper'

RSpec.describe ControlResource, type: :resource do
  describe 'serialization' do
    let!(:control) { create(:control) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(control.id)
      expect(data.jsonapi_type).to eq('controls')
    end
  end

  describe 'filtering' do
    let!(:control1) { create(:control) }
    let!(:control2) { create(:control) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: control2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([control2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:control1) { create(:control) }
      let!(:control2) { create(:control) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            control1.id,
            control2.id
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
            control2.id,
            control1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
