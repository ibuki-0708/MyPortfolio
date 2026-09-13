Rails.application.routes.draw do
  root 'matches#index'
  resources :matches, except: [:destroy] do
    resources :scores, only: [:create, :destroy]
    resources :match_comments, only: [:create, :destroy]
  end
  
  resources :opponents
  resources :players, except: [:show, :destroy]

end

