class ErdUrlsController < ApplicationController
  before_action :set_erd_url, only: %i[show edit update destroy]

  # GET /erd_urls
  def index
    @q = ErdUrl.ransack(params[:q])
    @erd_urls = @q.result(distinct: true).includes(:project).page(params[:page]).per(10)
  end

  # GET /erd_urls/1
  def show; end

  # GET /erd_urls/new
  def new
    @erd_url = ErdUrl.new
  end

  # GET /erd_urls/1/edit
  def edit; end

  # POST /erd_urls
  def create
    @erd_url = ErdUrl.new(erd_url_params)

    if @erd_url.save
      message = "ErdUrl was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @erd_url, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /erd_urls/1
  def update
    if @erd_url.update(erd_url_params)
      redirect_to @erd_url, notice: "Erd url was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /erd_urls/1
  def destroy
    @erd_url.destroy
    message = "ErdUrl was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to erd_urls_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_erd_url
    @erd_url = ErdUrl.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def erd_url_params
    params.require(:erd_url).permit(:project_id, :ideas_url, :image)
  end
end
