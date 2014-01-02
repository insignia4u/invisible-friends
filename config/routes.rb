InvisibleFriends::Application.routes.draw do
  get "home/index"

  root to: 'home#index'

  resources :games do
    resources :friends
  end

  get "/games/:id/shuffle", to: "games#shuffle", as: "game_shuffle"
  get "/games/:id/resend", to: "games#resend_notifications", as: "game_resend"

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get]
  match 'auth/failure', to: redirect('/'), via: [:get]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get]

end
