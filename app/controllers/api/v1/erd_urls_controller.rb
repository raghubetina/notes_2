class Api::V1::ErdUrlsController < Api::V1::GraphitiController
  def index
    erd_urls = ErdUrlResource.all(params)
    respond_with(erd_urls)
  end

  def show
    erd_url = ErdUrlResource.find(params)
    respond_with(erd_url)
  end

  def create
    erd_url = ErdUrlResource.build(params)

    if erd_url.save
      render jsonapi: erd_url, status: :created
    else
      render jsonapi_errors: erd_url
    end
  end

  def update
    erd_url = ErdUrlResource.find(params)

    if erd_url.update_attributes
      render jsonapi: erd_url
    else
      render jsonapi_errors: erd_url
    end
  end

  def destroy
    erd_url = ErdUrlResource.find(params)

    if erd_url.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: erd_url
    end
  end
end
