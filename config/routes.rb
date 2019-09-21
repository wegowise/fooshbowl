Fooshbowl::Application.routes.draw do
  root to: "standings#index"
  resources :games
  resources :players
  resources :standings, only: [:index]
end
