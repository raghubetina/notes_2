class CallbacksController < ApplicationController
  before_action :set_callback, only: %i[show edit update destroy]

  def index
    @q = Callback.ransack(params[:q])
    @callbacks = @q.result(distinct: true).includes(:project,
                                                    :event).page(params[:page]).per(10)
  end

  def show; end

  def new
    @callback = Callback.new
  end

  def edit; end

  def create
    @callback = Callback.new(callback_params)

    if @callback.save
      message = "Callback was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @callback, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @callback.update(callback_params)
      redirect_to @callback, notice: "Callback was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @callback.destroy
    message = "Callback was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to callbacks_url, notice: message
    end
  end

  private

  def set_callback
    @callback = Callback.find(params[:id])
  end

  def callback_params
    params.require(:callback).permit(:event_id, :project_id, :description)
  end
end
