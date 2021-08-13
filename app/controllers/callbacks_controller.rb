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
    redirect_to callbacks_url, notice: 'Callback was successfully destroyed.'
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
