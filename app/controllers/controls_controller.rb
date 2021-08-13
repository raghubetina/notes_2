class ControlsController < ApplicationController
  before_action :set_control, only: [:show, :edit, :update, :destroy]

  # GET /controls
  def index
    @controls = Control.page(params[:page]).per(10)
  end

  # GET /controls/1
  def show
  end

  # GET /controls/new
  def new
    @control = Control.new
  end

  # GET /controls/1/edit
  def edit
  end

  # POST /controls
  def create
    @control = Control.new(control_params)

    if @control.save
      message = 'Control was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @control, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /controls/1
  def update
    if @control.update(control_params)
      redirect_to @control, notice: 'Control was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /controls/1
  def destroy
    @control.destroy
    message = "Control was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to controls_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_control
      @control = Control.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def control_params
      params.require(:control).permit(:on_screen_id, :leads_to_screen_id, :copy, :crud)
    end
end
