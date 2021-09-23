Rails.application.routes.draw do
  resources :bookers
  devise_for :users
  root to: 'homes#top'
  resources :users
  get "/home/about" => "homes#about"
end