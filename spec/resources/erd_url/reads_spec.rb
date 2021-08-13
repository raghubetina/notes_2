require "rails_helper"

RSpec.describe ErdUrlResource, type: :resource do
  describe "serialization" do
    let!(:erd_url) { create(:erd_url) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(erd_url.id)
      expect(data.jsonapi_type).to eq("erd_urls")
    end
  end

  describe "filtering" do
    let!(:erd_url1) { create(:erd_url) }
    let!(:erd_url2) { create(:erd_url) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: erd_url2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([erd_url2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:erd_url1) { create(:erd_url) }
      let!(:erd_url2) { create(:erd_url) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      erd_url1.id,
                                      erd_url2.id,
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
                                      erd_url2.id,
                                      erd_url1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
