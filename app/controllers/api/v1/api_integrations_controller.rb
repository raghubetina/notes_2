class Api::V1::ApiIntegrationsController < Api::V1::GraphitiController
  def index
    api_integrations = ApiIntegrationResource.all(params)
    respond_with(api_integrations)
  end

  def show
    api_integration = ApiIntegrationResource.find(params)
    respond_with(api_integration)
  end

  def create
    api_integration = ApiIntegrationResource.build(params)

    if api_integration.save
      render jsonapi: api_integration, status: :created
    else
      render jsonapi_errors: api_integration
    end
  end

  def update
    api_integration = ApiIntegrationResource.find(params)

    if api_integration.update_attributes
      render jsonapi: api_integration
    else
      render jsonapi_errors: api_integration
    end
  end

  def destroy
    api_integration = ApiIntegrationResource.find(params)

    if api_integration.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: api_integration
    end
  end
end
