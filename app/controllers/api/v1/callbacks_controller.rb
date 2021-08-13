class Api::V1::CallbacksController < Api::V1::GraphitiController
  def index
    callbacks = CallbackResource.all(params)
    respond_with(callbacks)
  end

  def show
    callback = CallbackResource.find(params)
    respond_with(callback)
  end

  def create
    callback = CallbackResource.build(params)

    if callback.save
      render jsonapi: callback, status: 201
    else
      render jsonapi_errors: callback
    end
  end

  def update
    callback = CallbackResource.find(params)

    if callback.update_attributes
      render jsonapi: callback
    else
      render jsonapi_errors: callback
    end
  end

  def destroy
    callback = CallbackResource.find(params)

    if callback.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: callback
    end
  end
end
