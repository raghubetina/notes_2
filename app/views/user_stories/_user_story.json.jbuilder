json.extract! user_story, :id, :role, :capability, :benefit, :project_id, :notes, :created_at, :updated_at
json.url user_story_url(user_story, format: :json)
