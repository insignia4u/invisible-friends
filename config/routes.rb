InvisibleFriends::Application.routes.draw do
  get "home/index"

  root to: 'home#index'

  resources :games

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get]
  match 'auth/failure', to: redirect('/'), via: [:get]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get]

  get 'games/:id/friends' => 'friends#index', as: "game_friends"

end
