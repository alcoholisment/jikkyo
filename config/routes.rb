Rails.application.routes.draw do
  get 'rooms/show'
  root 'rooms#index'
  resources :rooms
end
