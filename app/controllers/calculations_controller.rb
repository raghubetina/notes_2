class CalculationsController < ApplicationController
  before_action :set_calculation, only: %i[show edit update destroy]

  # GET /calculations
  def index
    @q = Calculation.ransack(params[:q])
    @calculations = @q.result(distinct: true).includes(:project).page(params[:page]).per(10)
  end

  # GET /calculations/1
  def show; end

  # GET /calculations/new
  def new
    @calculation = Calculation.new
  end

  # GET /calculations/1/edit
  def edit; end

  # POST /calculations
  def create
    @calculation = Calculation.new(calculation_params)

    if @calculation.save
      message = "Calculation was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @calculation, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /calculations/1
  def update
    if @calculation.update(calculation_params)
      redirect_to @calculation, notice: "Calculation was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /calculations/1
  def destroy
    @calculation.destroy
    message = "Calculation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to calculations_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_calculation
    @calculation = Calculation.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def calculation_params
    params.require(:calculation).permit(:description, :project_id)
  end
end
