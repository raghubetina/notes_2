require 'rails_helper'

RSpec.describe StateMachineResource, type: :resource do
  describe 'serialization' do
    let!(:state_machine) { create(:state_machine) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(state_machine.id)
      expect(data.jsonapi_type).to eq('state_machines')
    end
  end

  describe 'filtering' do
    let!(:state_machine1) { create(:state_machine) }
    let!(:state_machine2) { create(:state_machine) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: state_machine2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([state_machine2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:state_machine1) { create(:state_machine) }
      let!(:state_machine2) { create(:state_machine) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            state_machine1.id,
            state_machine2.id
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
            state_machine2.id,
            state_machine1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
