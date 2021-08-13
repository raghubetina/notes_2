class ProjectsController < ApplicationController
  before_action :current_user_must_be_project_user,
                only: %i[edit update destroy]

  before_action :set_project, only: %i[show edit update destroy]

  def index
    @q = current_user.projects.ransack(params[:q])
    @projects = @q.result(distinct: true).includes(:user, :user_stories,
                                                   :api_integrations, :calculations, :screens, :callbacks, :state_machines, :scheduled_tasks, :erd_urls).page(params[:page]).per(10)
  end

  def show
    @erd_url = ErdUrl.new
    @scheduled_task = ScheduledTask.new
    @state_machine = StateMachine.new
    @callback = Callback.new
    @screen = Screen.new
    @calculation = Calculation.new
    @api_integration = ApiIntegration.new
    @user_story = UserStory.new
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)

    if @project.save
      message = "Project was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @project, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    message = "Project was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to projects_url, notice: message
    end
  end

  private

  def current_user_must_be_project_user
    set_project
    unless current_user == @project.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :existing_process,
                                    :job_to_be_done, :struggling_moment, :other, :existing_database, :user_id)
  end
end
