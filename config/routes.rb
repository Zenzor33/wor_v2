Rails.application.routes.draw do
  resources :favorites
  root "chairs#index"

  resources :chairs do 
    resources :reviews
  end

  resource :session, only: [:new, :create, :destroy] #note resource and session is singular

  resources :users
  get "signup" => "users#new"
end
