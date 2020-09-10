Rails.application.routes.draw do
  get 'rooms/show'
  root 'rooms#index'
  resources :rooms do
    resources :messages#, only: [:index, :create]
  end
end
