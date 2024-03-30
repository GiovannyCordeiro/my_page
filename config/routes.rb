Rails.application.routes.draw do
  devise_for :admins, :skip => [:registrations]
  root 'open#index'
  get '/my_annotations', controller: 'open', action: 'my_annotation'
  get '/my_annotations/tags', controller: 'open', action: 'annotation_tags'
  get '/my_annotations/tags/:type_tag', controller: 'open', action: 'annotation_tags'
  get '/my_annotations/:title_post', controller: 'open', action: 'specific_annotationt'
  resources :annotations
end
