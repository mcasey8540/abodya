Abodya::Application.routes.draw do

  devise_for :users

  root to: "properties#index" 
  resources :properties
  resources :searches
  resources :sellers

end
