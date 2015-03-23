json.array!(@gonzos) do |gonzo|
  json.extract! gonzo, :id, :title, :body
  json.url gonzo_url(gonzo, format: :json)
end
