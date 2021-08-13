class UserStoriesController < ApplicationController
  before_action :set_user_story, only: %i[show edit update destroy]

  def index
    @q = UserStory.ransack(params[:q])
    @user_stories = @q.result(distinct: true).includes(:project).page(params[:page]).per(10)
  end

  def show; end

  def new
    @user_story = UserStory.new
  end

  def edit; end

  def create
    @user_story = UserStory.new(user_story_params)

    if @user_story.save
      message = "UserStory was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @user_story, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @user_story.update(user_story_params)
      redirect_to @user_story, notice: "User story was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_story.destroy
    message = "UserStory was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to user_stories_url, notice: message
    end
  end

  private

  def set_user_story
    @user_story = UserStory.find(params[:id])
  end

  def user_story_params
    params.require(:user_story).permit(:role, :capability, :benefit,
                                       :project_id, :notes)
  end
end
