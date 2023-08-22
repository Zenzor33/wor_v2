Rails.application.routes.draw do
  resources :features
  
  root "chairs#index"

  resources :chairs do 
    resources :favorites, only: [:create, :destroy]
    resources :reviews
  end

  resource :session, only: [:new, :create, :destroy] #note resource and session is singular

  resources :users
  get "signup" => "users#new"
  get "chairs/filter/:filter" => "chairs#index", as: :filtered_chairs

end
