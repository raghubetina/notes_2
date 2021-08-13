require 'rails_helper'

RSpec.describe ScheduledTaskResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'scheduled_tasks',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ScheduledTaskResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ScheduledTask.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:scheduled_task) { create(:scheduled_task) }

    let(:payload) do
      {
        data: {
          id: scheduled_task.id.to_s,
          type: 'scheduled_tasks',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ScheduledTaskResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { scheduled_task.reload.updated_at }
      # .and change { scheduled_task.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:scheduled_task) { create(:scheduled_task) }

    let(:instance) do
      ScheduledTaskResource.find(id: scheduled_task.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ScheduledTask.count }.by(-1)
    end
  end
end
