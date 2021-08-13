class Api::V1::ScheduledTasksController < Api::V1::GraphitiController
  def index
    scheduled_tasks = ScheduledTaskResource.all(params)
    respond_with(scheduled_tasks)
  end

  def show
    scheduled_task = ScheduledTaskResource.find(params)
    respond_with(scheduled_task)
  end

  def create
    scheduled_task = ScheduledTaskResource.build(params)

    if scheduled_task.save
      render jsonapi: scheduled_task, status: 201
    else
      render jsonapi_errors: scheduled_task
    end
  end

  def update
    scheduled_task = ScheduledTaskResource.find(params)

    if scheduled_task.update_attributes
      render jsonapi: scheduled_task
    else
      render jsonapi_errors: scheduled_task
    end
  end

  def destroy
    scheduled_task = ScheduledTaskResource.find(params)

    if scheduled_task.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: scheduled_task
    end
  end
end
