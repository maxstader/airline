Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'passengers', to: 'passengers#index'
      get 'passengers/index'
      get 'passengers/show_all_with_flights'
      get 'passengers/show'
      post 'passengers/create'
      put 'passengers/update'
      delete 'passengers/destroy'
      ################################
      get 'flightofferings', to: 'flightofferings#index'
      get 'flightofferings/index'
      get 'flightofferings/show'
      post 'flightofferings/create'
      put 'flightofferings', to: 'flightofferings#update'
      put 'flightofferings/update'
      delete 'flightofferings/destroy'
      ################################
      get 'flightmanifests', to: 'flightmanifests#index'
      get 'flightmanifests/index'
      get 'flightmanifests/show'
      ################################
      get 'bookings', to: 'bookings#index'
      get 'bookings/index'
      get 'bookings/show'
      post 'bookings/create'
      post 'bookings/create_with_new_passenger'
      put 'bookings/update'
      delete 'bookings/destroy'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
