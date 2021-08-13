class CalculationsController < ApplicationController
  before_action :set_calculation, only: %i[show edit update destroy]

  def index
    @q = Calculation.ransack(params[:q])
    @calculations = @q.result(distinct: true).includes(:project).page(params[:page]).per(10)
  end

  def show; end

  def new
    @calculation = Calculation.new
  end

  def edit; end

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

  def update
    if @calculation.update(calculation_params)
      redirect_to @calculation, notice: "Calculation was successfully updated."
    else
      render :edit
    end
  end

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

  def set_calculation
    @calculation = Calculation.find(params[:id])
  end

  def calculation_params
    params.require(:calculation).permit(:description, :project_id)
  end
end
