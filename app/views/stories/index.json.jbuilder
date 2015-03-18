json.array!(@stories) do |story|
  json.extract! story, :id, :from, :text, :user_id, :title
  json.url story_url(story, format: :json)
end
