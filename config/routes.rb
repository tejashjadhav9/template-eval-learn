Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #  get '/users/:id/posts', to: 'posts#show'
   root "users#index"
   resources :users do
    member do
      get 'posts', to: 'posts#show'
    end
  end
  
   resources :posts
   resources :appointments
   resources :doctors
   resources :patients
end
