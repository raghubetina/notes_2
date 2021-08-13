class ScheduledTasksController < ApplicationController
  before_action :set_scheduled_task, only: [:show, :edit, :update, :destroy]

  # GET /scheduled_tasks
  def index
    @q = ScheduledTask.ransack(params[:q])
    @scheduled_tasks = @q.result(:distinct => true).includes(:project).page(params[:page]).per(10)
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
      message = 'ScheduledTask was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @scheduled_task, notice: message
      end
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
    message = "ScheduledTask was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to scheduled_tasks_url, notice: message
    end
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
