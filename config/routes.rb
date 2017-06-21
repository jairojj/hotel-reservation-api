Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :hotels do
    resources :rooms
  end
  
  get '/rooms', to: 'rooms#all'
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get '/reservations', to: 'reservations#index'
  post '/rooms/:room_id/reservations', to: 'reservations#create'
end
