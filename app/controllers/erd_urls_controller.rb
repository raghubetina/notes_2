class ErdUrlsController < ApplicationController
  before_action :set_erd_url, only: %i[show edit update destroy]

  def index
    @q = ErdUrl.ransack(params[:q])
    @erd_urls = @q.result(distinct: true).includes(:project).page(params[:page]).per(10)
  end

  def show; end

  def new
    @erd_url = ErdUrl.new
  end

  def edit; end

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

  def update
    if @erd_url.update(erd_url_params)
      redirect_to @erd_url, notice: "Erd url was successfully updated."
    else
      render :edit
    end
  end

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

  def set_erd_url
    @erd_url = ErdUrl.find(params[:id])
  end

  def erd_url_params
    params.require(:erd_url).permit(:project_id, :ideas_url, :image)
  end
end
