json.array!(@letters) do |letter|
  json.extract! letter, :id, :from, :text, :user_id
  json.url letter_url(letter, format: :json)
end
