# -*- encoding : utf-8 -*-
Officelunch::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "devise_custom/registrations", :omniauth_callbacks => "users/omniauth_callbacks"}

  resources :dashboard, only: :index do
    get :completion_order, on: :collection
  end
  resources :course_categories
  resources :courses
  resources :menus do
    post :send_email_about_dinner, on: :member
  end
  resources :users, except: [:show, :new, :create]
  resources :orders

  match "users/auth/google_oauth2/callback" => "users/omniauth_callbacks#goole_oauth2", via: :get

  root :to => "dashboard#index"

end
