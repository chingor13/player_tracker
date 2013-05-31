PlayerTracker::Application.routes.draw do

  resources :players
  resources :games
  resources :pitches

  root to: "players#index"
end
