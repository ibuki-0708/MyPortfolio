Rails.application.routes.draw do
  root 'matches#index'
  resources :matches, except: [:destroy]
    resources :scores, only: [:create, :destroy]
    resources :match_comment, only: [:create, :destroy]
  
  resources :opponents, except: [:new]
  resources :players, except: [:show, :destroy]

end

