Rails.application.routes.draw do
  resources :apps do
    resources :devices do 
      member do
        post :create, :format => :json
      end
      # curl -i -H "Content-Type: application/json" -d '{"device":{"identifier":"7757834C-D540-46A0-81A1-E4DE4B233838", "token":"71bfb7c572e7d81624c3475dd187f2909aae6377ff5e2d630e14abca818955ff", "lat":12.12312312, "lon":53.12321353, "locale":"it", "name":"Matteo Gavagnin"}}' -X POST  http://contactlab.local:3000/apps/0c22b8e87822c825/devices
      resources :messages do 
        # curl -i  -H "Content-Type: application/json" -d '{"message":{"title":"titolo del messaggio", "receiver_id":4}}' -X POST  http://contactlab.local:3000/apps/0c22b8e87822c825/devices/7757834C-D540-46A0-81A1-E4DE4B233838/messages
        member do
          # curl -i  -H "Content-Type: application/json" -X POST  http://contactlab.local:3000/apps/0c22b8e87822c825/devices/7757834C-D540-46A0-81A1-E4DE4B233838/messages/4/red
          post :red, :format => :json
        end
        member do
          # curl -i  -H "Content-Type: application/json" -X POST  http://contactlab.local:3000/apps/0c22b8e87822c825/devices/7757834C-D540-46A0-81A1-E4DE4B233838/messages/4/received
          post :received, :format => :json
        end
      end
    end
  end
  
  resources :devices  
  resources :messages

  root to: 'visitors#index'
end

# curl -i -H "Content-Type: application/json" -d '{"device":{"identifier":"7757834C-D540-46A0-81A1-E4DE4B233838", "token":"71bfb7c572e7d81624c3475dd187f2909aae6377ff5e2d630e14abca818955ff", "lat":12.12312312, "lon":53.12321353, "locale":"it", "name":"Matteo Gavagnin"}}' -X POST  http://contactlab.local:3000/apps/0c22b8e87822c825/devices