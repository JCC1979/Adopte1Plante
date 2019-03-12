Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: "sessions" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles, only: %i[show new create update edit] do
    resources :orders, only: %i[new create index show destroy]
    resources :carts, only: %i[new create index show] do
      resources :payments, only: %i[new create]
    end
  end

  resources :compositions, only: %i[show index new create edit update destroy] do
    resources :ratings, only: %i[create]
  end

  resources :plants, only: %i[index show new create update edit destroy] do
    resources :variant_plants, only: %i[new create]
  end

  resources :pots, only: %i[index new create update edit destroy] do
    resources :variant_pots, only: %i[new create]
  end

  resources :variant_pots, only: %i[edit update destroy]
  resources :variant_plants, only: %i[edit update destroy]

  get "/profiles/:id/my_plants/", to: "profiles#my_plants", as: "profiles_my_plants"
end
