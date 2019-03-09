Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations'}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles, only: %i[show new create update edit] do
    resources :orders, only: %i[new create index show destroy]
    resources :carts, only: %i[new create index show]
  end

  resources :compositions, only: %i[show index] do
    resources :ratings, only: %i[create]
  end

  resources :categories, only: %i[new create update edit]

  resources :products, only: %i[index show new create update edit] do
    resources :synonyms, only: %i[new create]
    resources :variants, only: %i[new create]
  end

  resources :variants, only: %i[index show edit update destroy]
  resources :synonyms, only: %i[edit update]
  get "/profiles/my_plants/:id", to: "profiles#my_plants", as: "profiles_my_plants"
end
