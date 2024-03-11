Rails.application.routes.draw do
  root 'open#index'
  resources :open, only: [:index]
end
