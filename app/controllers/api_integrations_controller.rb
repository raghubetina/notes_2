class ApiIntegrationsController < ApplicationController
  before_action :set_api_integration, only: [:show, :edit, :update, :destroy]

  # GET /api_integrations
  def index
    @api_integrations = ApiIntegration.page(params[:page]).per(10)
  end

  # GET /api_integrations/1
  def show
  end

  # GET /api_integrations/new
  def new
    @api_integration = ApiIntegration.new
  end

  # GET /api_integrations/1/edit
  def edit
  end

  # POST /api_integrations
  def create
    @api_integration = ApiIntegration.new(api_integration_params)

    if @api_integration.save
      message = 'ApiIntegration was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @api_integration, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /api_integrations/1
  def update
    if @api_integration.update(api_integration_params)
      redirect_to @api_integration, notice: 'Api integration was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /api_integrations/1
  def destroy
    @api_integration.destroy
    message = "ApiIntegration was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to api_integrations_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_integration
      @api_integration = ApiIntegration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_integration_params
      params.require(:api_integration).permit(:documentation, :purpose, :project_id, :example_endopoint)
    end
end
