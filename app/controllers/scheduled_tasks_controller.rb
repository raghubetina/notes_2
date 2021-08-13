class ScheduledTasksController < ApplicationController
  before_action :set_scheduled_task, only: [:show, :edit, :update, :destroy]

  # GET /scheduled_tasks
  def index
    @scheduled_tasks = ScheduledTask.all
  end

  # GET /scheduled_tasks/1
  def show
  end

  # GET /scheduled_tasks/new
  def new
    @scheduled_task = ScheduledTask.new
  end

  # GET /scheduled_tasks/1/edit
  def edit
  end

  # POST /scheduled_tasks
  def create
    @scheduled_task = ScheduledTask.new(scheduled_task_params)

    if @scheduled_task.save
      redirect_to @scheduled_task, notice: 'Scheduled task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /scheduled_tasks/1
  def update
    if @scheduled_task.update(scheduled_task_params)
      redirect_to @scheduled_task, notice: 'Scheduled task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /scheduled_tasks/1
  def destroy
    @scheduled_task.destroy
    redirect_to scheduled_tasks_url, notice: 'Scheduled task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_task
      @scheduled_task = ScheduledTask.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scheduled_task_params
      params.require(:scheduled_task).permit(:recurring, :occurence_schedule, :project_id, :description)
    end
end
