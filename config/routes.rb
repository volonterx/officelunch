Officelunch::Application.routes.draw do

  resources :dashboard, onle: :index
  root :to => "dashboard#index"

end
