require "rails_helper"

RSpec.describe CalculationResource, type: :resource do
  describe "serialization" do
    let!(:calculation) { create(:calculation) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(calculation.id)
      expect(data.jsonapi_type).to eq("calculations")
    end
  end

  describe "filtering" do
    let!(:calculation1) { create(:calculation) }
    let!(:calculation2) { create(:calculation) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: calculation2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([calculation2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:calculation1) { create(:calculation) }
      let!(:calculation2) { create(:calculation) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      calculation1.id,
                                      calculation2.id,
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
                                      calculation2.id,
                                      calculation1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
