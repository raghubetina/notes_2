require "rails_helper"

RSpec.describe ApiIntegrationResource, type: :resource do
  describe "serialization" do
    let!(:api_integration) { create(:api_integration) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(api_integration.id)
      expect(data.jsonapi_type).to eq("api_integrations")
    end
  end

  describe "filtering" do
    let!(:api_integration1) { create(:api_integration) }
    let!(:api_integration2) { create(:api_integration) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: api_integration2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([api_integration2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:api_integration1) { create(:api_integration) }
      let!(:api_integration2) { create(:api_integration) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      api_integration1.id,
                                      api_integration2.id,
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
                                      api_integration2.id,
                                      api_integration1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
