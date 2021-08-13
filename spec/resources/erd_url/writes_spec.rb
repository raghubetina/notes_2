require 'rails_helper'

RSpec.describe ErdUrlResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'erd_urls',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ErdUrlResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ErdUrl.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:erd_url) { create(:erd_url) }

    let(:payload) do
      {
        data: {
          id: erd_url.id.to_s,
          type: 'erd_urls',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ErdUrlResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { erd_url.reload.updated_at }
      # .and change { erd_url.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:erd_url) { create(:erd_url) }

    let(:instance) do
      ErdUrlResource.find(id: erd_url.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ErdUrl.count }.by(-1)
    end
  end
end
