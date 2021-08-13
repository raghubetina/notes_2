json.extract! project, :id, :name, :existing_process, :job_to_be_done,
              :struggling_moment, :other, :existing_database, :user_id, :created_at, :updated_at
json.url project_url(project, format: :json)
