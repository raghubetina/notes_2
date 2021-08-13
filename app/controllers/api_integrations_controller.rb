class ApiIntegrationsController < ApplicationController
  before_action :set_api_integration, only: %i[show edit update destroy]

  def index
    @q = ApiIntegration.ransack(params[:q])
    @api_integrations = @q.result(distinct: true).includes(:project).page(params[:page]).per(10)
  end

  def show; end

  def new
    @api_integration = ApiIntegration.new
  end

  def edit; end

  def create
    @api_integration = ApiIntegration.new(api_integration_params)

    if @api_integration.save
      message = "ApiIntegration was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @api_integration, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @api_integration.update(api_integration_params)
      redirect_to @api_integration,
                  notice: "Api integration was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @api_integration.destroy
    message = "ApiIntegration was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to api_integrations_url, notice: message
    end
  end

  private

  def set_api_integration
    @api_integration = ApiIntegration.find(params[:id])
  end

  def api_integration_params
    params.require(:api_integration).permit(:documentation, :purpose,
                                            :project_id, :example_endopoint)
  end
end
