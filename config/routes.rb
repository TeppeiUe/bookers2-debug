Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  root 'homes#top'
  get 'home/about' => 'homes#about'
end