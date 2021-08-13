require 'rails_helper'

RSpec.describe StateMachineResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'state_machines',
          attributes: { }
        }
      }
    end

    let(:instance) do
      StateMachineResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { StateMachine.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:state_machine) { create(:state_machine) }

    let(:payload) do
      {
        data: {
          id: state_machine.id.to_s,
          type: 'state_machines',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StateMachineResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { state_machine.reload.updated_at }
      # .and change { state_machine.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:state_machine) { create(:state_machine) }

    let(:instance) do
      StateMachineResource.find(id: state_machine.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { StateMachine.count }.by(-1)
    end
  end
end
