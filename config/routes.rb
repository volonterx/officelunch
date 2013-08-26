# -*- encoding : utf-8 -*-
Officelunch::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "devise_custom/registrations" }

  resources :dashboard, only: :index
  resources :course_categories
  resources :courses
  resources :menus

  root :to => "dashboard#index"

end
