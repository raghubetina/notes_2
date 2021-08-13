class ScheduledTasksController < ApplicationController
  before_action :set_scheduled_task, only: %i[show edit update destroy]

  def index
    @q = ScheduledTask.ransack(params[:q])
    @scheduled_tasks = @q.result(distinct: true).includes(:project).page(params[:page]).per(10)
  end

  def show; end

  def new
    @scheduled_task = ScheduledTask.new
  end

  def edit; end

  def create
    @scheduled_task = ScheduledTask.new(scheduled_task_params)

    if @scheduled_task.save
      message = "ScheduledTask was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @scheduled_task, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @scheduled_task.update(scheduled_task_params)
      redirect_to @scheduled_task,
                  notice: "Scheduled task was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @scheduled_task.destroy
    message = "ScheduledTask was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to scheduled_tasks_url, notice: message
    end
  end

  private

  def set_scheduled_task
    @scheduled_task = ScheduledTask.find(params[:id])
  end

  def scheduled_task_params
    params.require(:scheduled_task).permit(:recurring, :occurence_schedule,
                                           :project_id, :description)
  end
end
