json.extract! letter, :id, :user_id, :subject, :content, :created_at, :updated_at
json.url letter_url(letter, format: :json)
