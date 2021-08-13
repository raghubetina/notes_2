class Api::V1::CalculationsController < Api::V1::GraphitiController
  def index
    calculations = CalculationResource.all(params)
    respond_with(calculations)
  end

  def show
    calculation = CalculationResource.find(params)
    respond_with(calculation)
  end

  def create
    calculation = CalculationResource.build(params)

    if calculation.save
      render jsonapi: calculation, status: :created
    else
      render jsonapi_errors: calculation
    end
  end

  def update
    calculation = CalculationResource.find(params)

    if calculation.update_attributes
      render jsonapi: calculation
    else
      render jsonapi_errors: calculation
    end
  end

  def destroy
    calculation = CalculationResource.find(params)

    if calculation.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: calculation
    end
  end
end
