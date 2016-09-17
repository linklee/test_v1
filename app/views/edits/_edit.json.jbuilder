json.extract! edit, :id, :body, :user_id, :comment_id, :is_accepted, :created_at, :updated_at
json.url edit_url(edit, format: :json)