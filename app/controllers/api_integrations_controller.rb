class ApiIntegrationsController < ApplicationController
  before_action :set_api_integration, only: [:show, :edit, :update, :destroy]

  # GET /api_integrations
  def index
    @api_integrations = ApiIntegration.all
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
      redirect_to @api_integration, notice: 'Api integration was successfully created.'
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
    redirect_to api_integrations_url, notice: 'Api integration was successfully destroyed.'
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