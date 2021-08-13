class Api::V1::StateMachinesController < Api::V1::GraphitiController
  def index
    state_machines = StateMachineResource.all(params)
    respond_with(state_machines)
  end

  def show
    state_machine = StateMachineResource.find(params)
    respond_with(state_machine)
  end

  def create
    state_machine = StateMachineResource.build(params)

    if state_machine.save
      render jsonapi: state_machine, status: 201
    else
      render jsonapi_errors: state_machine
    end
  end

  def update
    state_machine = StateMachineResource.find(params)

    if state_machine.update_attributes
      render jsonapi: state_machine
    else
      render jsonapi_errors: state_machine
    end
  end

  def destroy
    state_machine = StateMachineResource.find(params)

    if state_machine.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: state_machine
    end
  end
end
