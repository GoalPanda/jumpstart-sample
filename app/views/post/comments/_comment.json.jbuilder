json.extract! comment, :id, :parent_id, :user_id, :message, :post_id, :created_at, :updated_at
json.url post_comment_url(comment, format: :json)
