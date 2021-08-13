require "rails_helper"

RSpec.describe ScheduledTaskResource, type: :resource do
  describe "serialization" do
    let!(:scheduled_task) { create(:scheduled_task) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(scheduled_task.id)
      expect(data.jsonapi_type).to eq("scheduled_tasks")
    end
  end

  describe "filtering" do
    let!(:scheduled_task1) { create(:scheduled_task) }
    let!(:scheduled_task2) { create(:scheduled_task) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: scheduled_task2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([scheduled_task2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:scheduled_task1) { create(:scheduled_task) }
      let!(:scheduled_task2) { create(:scheduled_task) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      scheduled_task1.id,
                                      scheduled_task2.id,
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
                                      scheduled_task2.id,
                                      scheduled_task1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
