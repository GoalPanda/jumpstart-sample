json.extract! comment, :id, :parent_id, :user_id, :message, :post_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
