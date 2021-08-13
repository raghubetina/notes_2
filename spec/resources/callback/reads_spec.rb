require "rails_helper"

RSpec.describe CallbackResource, type: :resource do
  describe "serialization" do
    let!(:callback) { create(:callback) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(callback.id)
      expect(data.jsonapi_type).to eq("callbacks")
    end
  end

  describe "filtering" do
    let!(:callback1) { create(:callback) }
    let!(:callback2) { create(:callback) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: callback2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([callback2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:callback1) { create(:callback) }
      let!(:callback2) { create(:callback) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      callback1.id,
                                      callback2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      callback2.id,
                                      callback1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
