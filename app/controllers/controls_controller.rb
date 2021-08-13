class ControlsController < ApplicationController
  before_action :set_control, only: %i[show edit update destroy]

  def index
    @q = Control.ransack(params[:q])
    @controls = @q.result(distinct: true).includes(:on_screen,
                                                   :leads_to_screen).page(params[:page]).per(10)
  end

  def show; end

  def new
    @control = Control.new
  end

  def edit; end

  def create
    @control = Control.new(control_params)

    if @control.save
      message = "Control was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @control, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @control.update(control_params)
      redirect_to @control, notice: "Control was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @control.destroy
    message = "Control was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to controls_url, notice: message
    end
  end

  private

  def set_control
    @control = Control.find(params[:id])
  end

  def control_params
    params.require(:control).permit(:on_screen_id, :leads_to_screen_id,
                                    :copy, :crud)
  end
end
