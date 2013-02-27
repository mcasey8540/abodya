Abodya::Application.routes.draw do

  devise_for :users

  root to: "properties#index" 
  resources :properties
  resources :searches
  resources :sellers
  resources :favorites

  match 'favorites/new/:assessment_id' => 'favorites#create', :as => :add_favorite
 
end
