Rails.application.routes.draw do
  devise_for :admins
  root 'open#index'
  get '/my_annotations', controller: 'open', action: 'myAnotation'
  get '/my_annotations/tags', controller: 'open', action: 'anotationTags'
  get '/my_annotations/tags/:type_tag', controller: 'open', action: 'anotationTags'
  get '/my_annotations/:title_post', controller: 'open', action: 'specificAnnotation'
  resources :annotations
end
