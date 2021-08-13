class Api::V1::UserStoriesController < Api::V1::GraphitiController
  def index
    user_stories = UserStoryResource.all(params)
    respond_with(user_stories)
  end

  def show
    user_story = UserStoryResource.find(params)
    respond_with(user_story)
  end

  def create
    user_story = UserStoryResource.build(params)

    if user_story.save
      render jsonapi: user_story, status: :created
    else
      render jsonapi_errors: user_story
    end
  end

  def update
    user_story = UserStoryResource.find(params)

    if user_story.update_attributes
      render jsonapi: user_story
    else
      render jsonapi_errors: user_story
    end
  end

  def destroy
    user_story = UserStoryResource.find(params)

    if user_story.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: user_story
    end
  end
end
