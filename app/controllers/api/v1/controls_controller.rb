class Api::V1::ControlsController < Api::V1::GraphitiController
  def index
    controls = ControlResource.all(params)
    respond_with(controls)
  end

  def show
    control = ControlResource.find(params)
    respond_with(control)
  end

  def create
    control = ControlResource.build(params)

    if control.save
      render jsonapi: control, status: 201
    else
      render jsonapi_errors: control
    end
  end

  def update
    control = ControlResource.find(params)

    if control.update_attributes
      render jsonapi: control
    else
      render jsonapi_errors: control
    end
  end

  def destroy
    control = ControlResource.find(params)

    if control.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: control
    end
  end
end
