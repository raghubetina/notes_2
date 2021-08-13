class ErdUrlsController < ApplicationController
  before_action :set_erd_url, only: [:show, :edit, :update, :destroy]

  # GET /erd_urls
  def index
    @erd_urls = ErdUrl.all
  end

  # GET /erd_urls/1
  def show
  end

  # GET /erd_urls/new
  def new
    @erd_url = ErdUrl.new
  end

  # GET /erd_urls/1/edit
  def edit
  end

  # POST /erd_urls
  def create
    @erd_url = ErdUrl.new(erd_url_params)

    if @erd_url.save
      redirect_to @erd_url, notice: 'Erd url was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /erd_urls/1
  def update
    if @erd_url.update(erd_url_params)
      redirect_to @erd_url, notice: 'Erd url was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /erd_urls/1
  def destroy
    @erd_url.destroy
    redirect_to erd_urls_url, notice: 'Erd url was successfully destroyed.'
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
