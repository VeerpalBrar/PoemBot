json.extract! poem, :id, :author, :content, :created_at, :updated_at
json.url poem_url(poem, format: :json)
