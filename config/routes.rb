PlayerTracker::Application.routes.draw do

  resources :players
  resources :games do
    resources :pitches
  end

  root to: "players#index"
end
