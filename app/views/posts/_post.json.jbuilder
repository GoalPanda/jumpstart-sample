json.extract! post, :id, :parent_id, :user_id, :title, :flag, :message, :project_id, :created_at, :updated_at
json.url post_url(post, format: :json)
