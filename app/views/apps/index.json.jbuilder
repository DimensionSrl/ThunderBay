json.array!(@apps) do |app|
  json.extract! app, :id, :key, :identifier, :environment, :password, :certificate
  json.url app_url(app, format: :json)
end
