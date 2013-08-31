# -*- encoding : utf-8 -*-
Officelunch::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "devise_custom/registrations" }

  resources :dashboard, only: :index
  resources :course_categories
  resources :courses
  resources :menus do
    post :send_email_about_dinner, on: :member
  end
  resources :users, except: [:show, :new, :create]
  resources :orders

  root :to => "dashboard#index"

end
