class CallbacksController < ApplicationController
  before_action :set_callback, only: [:show, :edit, :update, :destroy]

  # GET /callbacks
  def index
    @callbacks = Callback.all
  end

  # GET /callbacks/1
  def show
  end

  # GET /callbacks/new
  def new
    @callback = Callback.new
  end

  # GET /callbacks/1/edit
  def edit
  end

  # POST /callbacks
  def create
    @callback = Callback.new(callback_params)

    if @callback.save
      redirect_to @callback, notice: 'Callback was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /callbacks/1
  def update
    if @callback.update(callback_params)
      redirect_to @callback, notice: 'Callback was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /callbacks/1
  def destroy
    @callback.destroy
    message = "Callback was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to callbacks_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_callback
      @callback = Callback.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def callback_params
      params.require(:callback).permit(:event_id, :project_id, :description)
    end
end
