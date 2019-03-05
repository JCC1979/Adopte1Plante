Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles, only: %i[show new create update edit] do
    resources :orders, only: %i[new create index show]
  end

  resources :compositions, only: %i[show index] do
    resources :ratings, only: %i[create]
  end

  resources :categories, only: %i[new create update edit]

  resources :products, only: %i[show new create update edit] do
    resources :synonyms, only: %i[new create]
    resources :variants, only: %i[new create]
  end

  resources :variants, only: %i[edit update destroy]
  resources :synonyms, only: %i[edit update]
end
