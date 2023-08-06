Rails.application.routes.draw do
  root "chairs#index"

  resources :chairs do 
    resources :reviews
  end

  resources :users
  get "signup" => "users#new"
end
