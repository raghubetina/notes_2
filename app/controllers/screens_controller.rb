class ScreensController < ApplicationController
  before_action :set_screen, only: %i[show edit update destroy]

  def index
    @q = Screen.ransack(params[:q])
    @screens = @q.result(distinct: true).includes(:project,
                                                  :outgoing_controls, :incoming_controls, :leads_to_screens, :incoming_screens).page(params[:page]).per(10)
  end

  def show
    @control = Control.new
  end

  def new
    @screen = Screen.new
  end

  def edit; end

  def create
    @screen = Screen.new(screen_params)

    if @screen.save
      message = "Screen was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @screen, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @screen.update(screen_params)
      redirect_to @screen, notice: "Screen was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @screen.destroy
    message = "Screen was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to screens_url, notice: message
    end
  end

  private

  def set_screen
    @screen = Screen.find(params[:id])
  end

  def screen_params
    params.require(:screen).permit(:project_id, :wireframe, :description,
                                   :url_pattern, :title)
  end
end
