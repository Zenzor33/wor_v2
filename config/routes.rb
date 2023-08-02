Rails.application.routes.draw do
  resources :users

  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "chairs#index"

  resources :chairs do 
    resources :reviews
  end
end
