json.extract! state_machine, :id, :link_to_diagram, :project_id, :notes, :dsl,
              :diagram, :table, :column, :created_at, :updated_at
json.url state_machine_url(state_machine, format: :json)
