json.array!(@devices) do |device|
  json.extract! device, :id, :identifier, :token, :app_id, :last_access, :lat, :lon, :locale, :name
  json.url device_url(device, format: :json)
end
