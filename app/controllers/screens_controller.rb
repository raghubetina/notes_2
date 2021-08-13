class ScreensController < ApplicationController
  before_action :set_screen, only: [:show, :edit, :update, :destroy]

  # GET /screens
  def index
    @screens = Screen.all
  end

  # GET /screens/1
  def show
  end

  # GET /screens/new
  def new
    @screen = Screen.new
  end

  # GET /screens/1/edit
  def edit
  end

  # POST /screens
  def create
    @screen = Screen.new(screen_params)

    if @screen.save
      redirect_to @screen, notice: 'Screen was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /screens/1
  def update
    if @screen.update(screen_params)
      redirect_to @screen, notice: 'Screen was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /screens/1
  def destroy
    @screen.destroy
    message = "Screen was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to screens_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screen
      @screen = Screen.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def screen_params
      params.require(:screen).permit(:project_id, :wireframe, :description, :url_pattern, :title)
    end
end
