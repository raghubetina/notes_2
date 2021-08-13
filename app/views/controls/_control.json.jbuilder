json.extract! control, :id, :on_screen_id, :leads_to_screen_id, :copy, :crud,
              :created_at, :updated_at
json.url control_url(control, format: :json)
