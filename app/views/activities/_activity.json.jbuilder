json.extract! activity, :id, :name, :code, :description, :budget, :color, :status, :flag, :parent_id, :user_id, :component_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
