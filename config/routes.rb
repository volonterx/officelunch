Officelunch::Application.routes.draw do

  devise_for :users
  resources :dashboard, onle: :index
  root :to => "dashboard#index"

end
