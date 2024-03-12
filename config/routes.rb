Rails.application.routes.draw do
  root 'open#index'
  get '/my_anotations', controller: 'open', action: 'myAnotation'
  # resources :open, only: %i[index notes]
end
