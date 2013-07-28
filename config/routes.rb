Fooshbowl::Application.routes.draw do
  root to: "games#index"
  resources :games
  resources :players
end
