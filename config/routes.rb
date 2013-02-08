Abodya::Application.routes.draw do

  root to: "properties#index" 
  resources :properties
  resources :searches

end
