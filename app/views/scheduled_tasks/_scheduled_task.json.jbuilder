json.extract! scheduled_task, :id, :recurring, :occurence_schedule,
              :project_id, :description, :created_at, :updated_at
json.url scheduled_task_url(scheduled_task, format: :json)
